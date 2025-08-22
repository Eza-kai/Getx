import 'package:fgetx/app/modules/formulir/views/formulir_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/formulir_controller.dart';

class FormulirView extends GetView<FormulirController> {
  const FormulirView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50, // background soft pink
      appBar: AppBar(
        title: const Text(
          'Formulir Pendaftaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink.shade300,
        elevation: 4,
        shadowColor: Colors.pink.shade200,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Nama
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                labelStyle: TextStyle(color: Colors.pink.shade400),
                prefixIcon: Icon(Icons.person, color: Colors.pink.shade300),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Dropdown Kursus
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: 'Pilih Kursus',
                labelStyle: TextStyle(color: Colors.pink.shade400),
                prefixIcon: Icon(Icons.book, color: Colors.pink.shade300),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              items: controller.courses.map((course) {
                return DropdownMenuItem(
                  value: course,
                  child: Text(course),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectedContent.value = value!;
              },
            ),
            const SizedBox(height: 20),

            // Radio Gender
            Obx(
              () => Column(
                children: [
                  RadioListTile(
                    activeColor: Colors.pink.shade400,
                    title: const Text('Laki-Laki'),
                    value: 'Laki-Laki',
                    groupValue: controller.gender.value,
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                  ),
                  RadioListTile(
                    activeColor: Colors.pink.shade400,
                    title: const Text('Perempuan'),
                    value: 'Perempuan',
                    groupValue: controller.gender.value,
                    onChanged: (value) {
                      controller.gender.value = value!;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Date Picker
            Obx(
              () => TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Tanggal Lahir',
                  labelStyle: TextStyle(color: Colors.pink.shade400),
                  prefixIcon: Icon(Icons.calendar_today, color: Colors.pink.shade300),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                controller: TextEditingController(
                  text: controller.formattedDate,
                ),
                onTap: () => controller.pickDate(),
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Submit
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade300,
                foregroundColor: Colors.white,
                elevation: 6,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => Get.to(FormulirOutputView()),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
