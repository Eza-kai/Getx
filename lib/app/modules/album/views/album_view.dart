import 'package:fgetx/app/modules/album/views/album_detail..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/album_controller.dart';

class AlbumView extends StatelessWidget {
  final AlbumController controller = Get.put(AlbumController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F5), // soft pink background
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8BBD0), // pink pastel
        title: const Text(
          "📀 Album List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 6,
        shadowColor: Colors.pinkAccent.withOpacity(0.5),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.albums.isEmpty) {
          return const Center(child: Text("No albums available"));
        }
        return ListView.builder(
          itemCount: controller.albums.length,
          itemBuilder: (context, index) {
            final album = controller.albums[index];
            return Card(
              color: const Color(0xFFFCE4EC), // soft pink card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              elevation: 4,
              shadowColor: Colors.pinkAccent.withOpacity(0.3),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                title: Text(
                  album.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.pinkAccent,
                  ),
                ),
                subtitle: Text(
                  "Album ID: ${album.id}",
                  style: const TextStyle(color: Colors.black54),
                ),
                onTap: () {
                  Get.to(() => AlbumDetailView(album: album));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
