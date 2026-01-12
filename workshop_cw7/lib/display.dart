import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  final int number;

  const DisplayPage ({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    bool isEven = number % 2 == 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'ตัวเลขที่กรอก : $number',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              isEven ? 'เป็นเลขคู่' : 'เป็นเลขคี่',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Image.asset(
              isEven ? 'assets/even.jpg' : 'assets/odd.jpg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('กลับไปหน้าเดิม'),
            ),
          ],
        ),
      ),
    );
  }
}