import 'package:fgetx/app/modules/formulir/controllers/formulir_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulirOutputView extends StatelessWidget {
  FormulirOutputView({super.key});

  final FormulirController formulir = Get.find<FormulirController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50, // soft pink bg
      appBar: AppBar(
        title: const Text(
          'Hasil Formulir',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink.shade300,
        elevation: 4,
        shadowColor: Colors.pink.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 6,
            shadowColor: Colors.pink.shade200,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItem("👤 Nama", formulir.nameController.text),
                  const SizedBox(height: 12),
                  _buildItem("📚 Kursus", formulir.selectedContent.value),
                  const SizedBox(height: 12),
                  _buildItem("📅 Tanggal Kursus", formulir.formattedDate),
                  const SizedBox(height: 12),
                  _buildItem("🚻 Gender", formulir.gender.value),
                  const SizedBox(height: 30),

                  // Tombol kembali
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade300,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 6,
                      ),
                      onPressed: () {
                        formulir.clearForm();
                        Get.back(); // balik ke form
                      },
                      child: const Text(
                        "Kembali",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title : ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.pink.shade400,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Text(
            value.isNotEmpty ? value : "-",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
