import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormulirController extends GetxController {
  // Controller untuk input teks
  final nameController = TextEditingController();

  // Dropdown pilihan kursus
  final selectedContent = ''.obs;
  final List<String> courses = ['Flutter', 'Dart', 'Java', 'Python', 'JavaScript'];

  // Radio Button gender
  final gender = ''.obs;

  // Date Picker
  final selectedDate = DateTime.now().obs;
  String get formattedDate =>
      DateFormat('dd/MM/yyyy').format(selectedDate.value);

  // Fungsi pilih tanggal
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

  // Reset form
  void clearForm() {
    nameController.clear();
    selectedContent.value = '';
    gender.value = '';
    selectedDate.value = DateTime.now();
  }

  // Jangan lupa dispose controller
  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
