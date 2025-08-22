import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PemesananController extends GetxController {
  final namaController = TextEditingController();

  final baksoJumlah = 0.obs;
  final kopiJumlah = 0.obs;

  final subtotal = 0.obs;
  final totalHarga = 0.obs;
  final diskonPersen = 0.obs;

  final selectedDate = DateTime.now().obs;
  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(selectedDate.value);

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  void hitungTotal() {
    subtotal.value = (baksoJumlah.value * 5000) + (kopiJumlah.value * 15000);

    double diskon = 0;
    if (subtotal.value >= 250000) {
      diskon = 0.10;
    } else if (subtotal.value >= 150000) {
      diskon = 0.05;
    }

    diskonPersen.value = (diskon * 100).toInt();
    totalHarga.value = subtotal.value - (subtotal.value * diskon).toInt();
  }

  void clearForm() {
    namaController.clear();
    baksoJumlah.value = 0;
    kopiJumlah.value = 0;
    subtotal.value = 0;
    totalHarga.value = 0;
    diskonPersen.value = 0;
    selectedDate.value = DateTime.now();
  }

  @override
  void onClose() {
    namaController.dispose();
    super.onClose();
  }
}
