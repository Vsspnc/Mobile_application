import 'package:flutter/material.dart';
import 'dart:math';

class CirclePage extends StatefulWidget {
  final bool isArea;

  const CirclePage({
    super.key,
    required this.isArea,
  });

  @override
  State<CirclePage> createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  final TextEditingController _r = TextEditingController();
  double? result;

  void calculate() {
    final double r = double.tryParse(_r.text) ?? 0;

    setState(() {
      result = widget.isArea
          ? pi * r * r
          : (4 / 3) * pi * pow(r, 3);
    });
  }

  @override
  void dispose() {
    _r.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isArea ? 'พื้นที่วงกลม' : 'ปริมาตรทรงกลม'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _r,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'รัศมี',
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
