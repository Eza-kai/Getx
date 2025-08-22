import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';
import '../controllers/pemesanan_controller.dart';

class OutputView extends StatefulWidget {
  const OutputView({super.key});

  @override
  State<OutputView> createState() => _OutputViewState();
}

class _OutputViewState extends State<OutputView>
    with SingleTickerProviderStateMixin {
  late AnimationController scaleController;
  final PemesananController controller = Get.find();

  @override
  void initState() {
    super.initState();
    scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.0,
      upperBound: 1.0,
    );
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8BBD0),
        title: const Text(
          "Struk Pesanan",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: Obx(
          () => Center(
            child: BounceInUp(
              duration: const Duration(milliseconds: 800),
              child: GestureDetector(
                onTapDown: (_) => scaleController.forward(),
                onTapUp: (_) => scaleController.reverse(),
                onTapCancel: () => scaleController.reverse(),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 1.0, end: 1.05)
                      .animate(CurvedAnimation(
                    parent: scaleController,
                    curve: Curves.easeOut,
                  )),
                  child: _buildStrukCard(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStrukCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.shade100.withOpacity(0.6),
            blurRadius: 12,
            spreadRadius: 3,
            offset: const Offset(4, 6),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.person, color: Colors.pinkAccent),
              SizedBox(width: 8),
              Text(
                "Data Pemesan",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent),
              ),
            ],
          ),
          const Divider(),
          Text("Nama Pemesan : ${controller.namaController.text}"),
          Text("Tanggal Pesan : ${controller.formattedDate}"),
          const SizedBox(height: 16),
          Row(
            children: const [
              Icon(Icons.fastfood, color: Colors.pinkAccent),
              SizedBox(width: 8),
              Text(
                "Detail Pesanan",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent),
              ),
            ],
          ),
          const Divider(),
          Text("Bakso : ${controller.baksoJumlah.value} x Rp5000"),
          Text("Kopi  : ${controller.kopiJumlah.value} x Rp15000"),
          const SizedBox(height: 16),
          Row(
            children: const [
              Icon(Icons.receipt_long, color: Colors.pinkAccent),
              SizedBox(width: 8),
              Text(
                "Ringkasan Pesanan",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent),
              ),
            ],
          ),
          const Divider(),
          Text(
              "Total Harga : Rp ${controller.subtotal.value}"),
          Text("Diskon: ${controller.diskonPersen.value}%"),
          const SizedBox(height: 8),
          Text(
            "Total Bayar: Rp ${controller.totalHarga.value}",
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              "✨ Terima kasih sudah memesan ✨",
              style: TextStyle(
                color: Colors.pink.shade300,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
