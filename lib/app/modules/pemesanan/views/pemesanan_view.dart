import 'package:fgetx/app/modules/pemesanan/views/pemesanan_output_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pemesanan_controller.dart';

class PesananView extends GetView<PemesananController> {
  const PesananView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF0F5), // pink soft background
      appBar: AppBar(
        backgroundColor: const Color(0xFFE91E63), // pink fuchsia
        title: const Text(
          'Pemesanan Kuliner',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Nama Pemesan
            _inputCard(
              child: TextField(
                style: const TextStyle(color: Colors.black87),
                controller: controller.namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Pemesan',
                  labelStyle: TextStyle(color: Colors.black54),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.person, color: Colors.pinkAccent),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Bakso
            _menuCard(
              title: "Bakso",
              price: 5000,
              jumlah: controller.baksoJumlah,
              icon: Icons.ramen_dining, // icon mangkok bakso
              onAdd: () {
                controller.baksoJumlah.value++;
                controller.hitungTotal();
              },
              onRemove: () {
                if (controller.baksoJumlah.value > 0) {
                  controller.baksoJumlah.value--;
                  controller.hitungTotal();
                }
              },
            ),
            const SizedBox(height: 16),

            // Kopi
            _menuCard(
              title: "Kopi",
              price: 15000,
              jumlah: controller.kopiJumlah,
              icon: Icons.local_cafe, // icon cangkir kopi
              onAdd: () {
                controller.kopiJumlah.value++;
                controller.hitungTotal();
              },
              onRemove: () {
                if (controller.kopiJumlah.value > 0) {
                  controller.kopiJumlah.value--;
                  controller.hitungTotal();
                }
              },
            ),
            const SizedBox(height: 20),

            // Tanggal
            _inputCard(
              child: Obx(
                () => TextField(
                  readOnly: true,
                  style: const TextStyle(color: Colors.black87),
                  decoration: const InputDecoration(
                    labelText: 'Tanggal Pesan',
                    labelStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.pinkAccent),
                  ),
                  controller: TextEditingController(
                    text: controller.formattedDate,
                  ),
                  onTap: () => controller.pickDate(),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Submit
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE91E63), // pink tegas
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 3,
              ),
              onPressed: () {
                controller.hitungTotal();
                Get.to(() => const OutputView());
              },
              icon: const Icon(Icons.favorite, color: Colors.white), // icon love lucu
              label: const Text(
                'Submit Pesanan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Card Input
  Widget _inputCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFEBEE), // pink pastel lembut
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: child,
    );
  }

  // Menu Card
  Widget _menuCard({
    required String title,
    required int price,
    required RxInt jumlah,
    required IconData icon,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
  }) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFEBEE), // pink pastel
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.pinkAccent),
                const SizedBox(width: 8),
                Text(
                  "$title - Rp $price",
                  style: const TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.pinkAccent),
                  onPressed: onRemove,
                ),
                Text(
                  "${jumlah.value}",
                  style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.pink),
                  onPressed: onAdd,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
