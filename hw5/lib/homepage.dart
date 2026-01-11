import 'package:flutter/material.dart';
import 'result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController n1 = TextEditingController();
  final TextEditingController n2 = TextEditingController();
  final TextEditingController n3 = TextEditingController();
  final TextEditingController money = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lottery N3')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('เลือกเลขท้าย 3 ตัว', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),

            /// ช่องกรอกเลข 3 หลัก
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _box(n1),
                const SizedBox(width: 10),
                _box(n2),
                const SizedBox(width: 10),
                _box(n3),
              ],
            ),

            const SizedBox(height: 20),

            /// ช่องกรอกเงิน
            TextField(
              controller: money,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'จำนวนเงินที่ต้องการซื้อ (บาท)',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            /// ปุ่มตรวจรางวัล
            ElevatedButton(
              onPressed: () {
                String number = n1.text + n2.text + n3.text;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      userNumber: number,
                      buyMoney: int.parse(money.text),
                    ),
                  ),
                );
              },
              child: const Text('ตรวจรางวัล'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _box(TextEditingController c) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: c,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}