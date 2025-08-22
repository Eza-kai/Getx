import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F5), // soft pink background
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8BBD0), // pink pastel
        title: const Text(
          '🌸 Home Page',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 6,
        shadowColor: Colors.pinkAccent.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // tombol full width
          children: [
            buildPinkButton("Counter Page", Icons.calculate, '/counter'),
            const SizedBox(height: 20),
            buildPinkButton("Formulir Page", Icons.edit_note, '/formulir'),
            const SizedBox(height: 20),
            buildPinkButton("Pemesanan Page", Icons.fastfood, '/pemesanan'),
            const SizedBox(height: 20),
            buildPinkButton("Page Post", Icons.post_add, '/post'),
            const SizedBox(height: 20),
            buildPinkButton("Page Albums", Icons.album_outlined, '/album'),
          ],
        ),
      ),
    );
  }

  Widget buildPinkButton(String text, IconData icon, String route) {
    return SizedBox(
      height: 55, // semua tombol tinggi sama
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF8BBD0), // tombol pink pastel
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          elevation: 6,
          shadowColor: Colors.pinkAccent.withOpacity(0.4),
        ),
        onPressed: () => Get.toNamed(route),
        icon: Icon(icon, size: 22),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
