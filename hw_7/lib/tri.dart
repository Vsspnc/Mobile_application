import 'package:flutter/material.dart';

class TrianglePage extends StatefulWidget {
  final bool isArea;

  const TrianglePage({
    super.key,
    required this.isArea,
  });

  @override
  State<TrianglePage> createState() => _TrianglePageState();
}

class _TrianglePageState extends State<TrianglePage> {
  final TextEditingController _b = TextEditingController();
  final TextEditingController _h = TextEditingController();

  double? result;

  void calculate() {
    final double b = double.tryParse(_b.text) ?? 0;
    final double h = double.tryParse(_h.text) ?? 0;

    setState(() {
      // Area = 1/2 × ฐาน × สูง
      // Volume (ทรงพีระมิดฐานสามเหลี่ยม ตัวอย่าง) = 1/3 × ฐาน × สูง × สูง
      result = widget.isArea
          ? 0.5 * b * h
          : (1 / 3) * b * h * h;
    });
  }

  @override
  void dispose() {
    _b.dispose();
    _h.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isArea ? 'พื้นที่สามเหลี่ยม' : 'ปริมาตรสามเหลี่ยม'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _b,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'ฐาน',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _h,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'สูง',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculate,
              child: const Text('คำนวณ'),
            ),
            const SizedBox(height: 16),
            if (result != null)
              Text(
                'ผลลัพธ์ = $result',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
