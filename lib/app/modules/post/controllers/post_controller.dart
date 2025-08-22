import 'package:fgetx/app/data/models/post_model.dart';
import 'package:get/get.dart';
import '../services/post_service.dart';

class PostController extends GetxController {
  final PostService _service = PostService();

  // State
  var posts = <Post>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getPosts(); // otomatis fetch saat controller di-init
  }

  /// Fetch semua posts
  Future<void> getPosts() async {
    try {
      isLoading(true);
      errorMessage('');
      final result = await _service.fetchPosts();
      posts.assignAll(result);
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar("Error", errorMessage.value);
    } finally {
      isLoading(false);
    }
  }

  /// Fetch single post by ID
  Future<Post?> getPostById(int id) async {
    try {
      isLoading(true);
      final post = await _service.fetchPosts();       
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    } finally {
      isLoading(false);
    }
  }

  /// Refresh posts (bisa dipakai di Pull-to-Refresh)
  Future<void> refreshPosts() async {
    await getPosts();
  }
}
