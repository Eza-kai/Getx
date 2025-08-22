import 'package:fgetx/app/data/models/album_model.dart';
import 'package:get/get.dart';
import '../services/album_service.dart';

class AlbumController extends GetxController {
  var albums = <Album>[].obs;
  var isLoading = true.obs;

  final AlbumService _service = AlbumService();

  @override
  void onInit() {
    super.onInit(); 
    getAlbums();
  }

  void getAlbums() async {
    try {
      isLoading(true);
      var result = await _service.fetchAlbums();
      albums.assignAll(result);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
