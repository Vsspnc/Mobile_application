import 'package:flutter/material.dart';

class RectanglePage extends StatefulWidget {
  final bool isArea;

  const RectanglePage({
    super.key,
    required this.isArea,
  });

  @override
  State<RectanglePage> createState() => _RectanglePageState();
}

class _RectanglePageState extends State<RectanglePage> {
  final TextEditingController _w = TextEditingController();
  final TextEditingController _h = TextEditingController();

  double? result;

  void calculate() {
    final double w = double.tryParse(_w.text) ?? 0;
    final double h = double.tryParse(_h.text) ?? 0;

    setState(() {
      result = widget.isArea ? w * h : w * h * h;
    });
  }

  @override
  void dispose() {
    _w.dispose();
    _h.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isArea ? 'พื้นที่สี่เหลี่ยม' : 'ปริมาตรสี่เหลี่ยม'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _w,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'ความกว้าง',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _h,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'ความสูง',
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
