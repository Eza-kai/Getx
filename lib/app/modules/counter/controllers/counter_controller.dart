import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = 0.obs;

  void increment() {
    if (count.value < 50) {
      count.value++;
    } else {
      Get.snackbar(
        '🌸 STOP 🌸',
        'Maksimal 50 aja ya <3',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFF8BBD0), // pink pastel
        colorText: Colors.white,
        borderRadius: 12,
        margin: const EdgeInsets.all(12),
        icon: const Icon(Icons.favorite, color: Colors.white),
        snackStyle: SnackStyle.FLOATING,
      );
    }
  }

  void decrement() {
    if (count.value > 0) {
      count.value--;
    } else {
      Get.snackbar(
        '✨ STOP ✨',
        'Gabisa kurang dari 0 ya ganteng 😘',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFF48FB1), // soft pink
        colorText: Colors.white,
        borderRadius: 12,
        margin: const EdgeInsets.all(12),
        icon: const Icon(Icons.cake, color: Colors.white),
        snackStyle: SnackStyle.FLOATING,
      );
    }
  }
}
