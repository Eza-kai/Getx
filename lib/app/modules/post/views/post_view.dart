import 'package:fgetx/app/modules/post/views/post_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class PostView extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50, // 🎀 background soft pink
      appBar: AppBar(
        title: const Text("Posts (GetX + GetConnect)"),
        backgroundColor: Colors.pink.shade300, // 🎀 appbar pink
        elevation: 2,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.posts.isEmpty) {
          return const Center(
            child: Text(
              "No posts available",
              style: TextStyle(
                fontSize: 16,
                color: Colors.pink,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshPosts,
          color: Colors.pink,
          child: ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              final post = controller.posts[index];
              return Card(
                margin: const EdgeInsets.all(8),
                color: Colors.pink.shade100, // 🎀 card soft pink
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                child: ListTile(
                  title: Text(
                    post.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pink.shade900, // 🎀 teks judul pink tua
                    ),
                  ),
                  subtitle: Text(
                    post.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.pink.shade800,
                    ),
                  ),
                  onTap: () {
                    Get.to(() => PostDetailView(post: post));
                  },
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
