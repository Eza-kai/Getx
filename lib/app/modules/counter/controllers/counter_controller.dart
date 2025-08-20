import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = 0.obs;

  void increment() {
    if (count.value < 50) {
      count.value++;
    } else {
      Get.snackbar(
        'STOP',
        'Maksimal 50 Yach <3',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.warning, color: Colors.white),
      );
    }
  }

  void decrement() {
    if (count.value > 0) {
      count.value--;
    } else {
      Get.snackbar(
        'STOP',
        'Gabisa Kurang Dari 0 Yach Ganteng',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green ,
        colorText: Colors.white,
        icon: const Icon(Icons.info, color: Colors.white),
      );
    }
  }
}
