import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({super.key});
  CounterController cont = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50, 
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
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
                    color: Colors.green.shade800,
                  ),
                  child: Text('Hitung ke: ${controller.count}'),
                )),
            const SizedBox(height: 30),

            // Tombol + dan - berdampingan
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [              
                ElevatedButton(
                  onPressed: cont.decrement,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    foregroundColor: Colors.white,
                    elevation: 8, // efek shadow
                    shadowColor: Colors.black54,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Icon(Icons.remove, size: 28),
                ),
                const SizedBox(width: 20),                
                ElevatedButton(
                  onPressed: cont.increment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade300,
                    foregroundColor: Colors.white,
                    elevation: 8, // efek shadow
                    shadowColor: Colors.black54,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
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
