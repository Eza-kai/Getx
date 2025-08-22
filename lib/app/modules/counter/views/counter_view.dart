import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({super.key});
  CounterController cont = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F5), // soft pink background
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8BBD0), // pink pastel
        title: const Text(
          '🌸 Counter View',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 6,
        shadowColor: Colors.pinkAccent.withOpacity(0.4),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // animasi font membesar/mengecil sesuai count
            Obx(() => AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  style: TextStyle(
                    fontSize: 20 + controller.count.value.toDouble(),
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade700,
                  ),
                  child: Text('Hitung ke: ${controller.count}'),
                )),
            const SizedBox(height: 40),

            // Tombol + dan - dibikin pink soft
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: cont.decrement,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF48FB1), // soft pink
                    foregroundColor: Colors.white,
                    elevation: 6,
                    shadowColor: Colors.pinkAccent.withOpacity(0.5),
                    padding: const EdgeInsets.all(18),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.remove, size: 28),
                ),
                const SizedBox(width: 25),
                ElevatedButton(
                  onPressed: cont.increment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63), // pink lebih pekat
                    foregroundColor: Colors.white,
                    elevation: 6,
                    shadowColor: Colors.pinkAccent.withOpacity(0.5),
                    padding: const EdgeInsets.all(18),
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.add, size: 28),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
