//
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String major;
  final String subject;
  final int keep;
  final int mid;
  final int fin;

  ResultPage({
    required this.name,
    required this.major,
    required this.subject,
    required this.keep,
    required this.mid,
    required this.fin,
  });

  @override
  Widget build(BuildContext context) {
    int total = keep + mid + fin;
    String grade;

    if (total >= 80) grade = "A";
    else if (total >= 70) grade = "B";
    else if (total >= 60) grade = "C";
    else if (total >= 50) grade = "D";
    else grade = "F";

    return Scaffold(
      appBar: AppBar(title: Text("ผลการคำนวณ")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ชื่อ: $name"),
            Text("สาขา: $major"),
            Text("รายวิชา: $subject"),

            Divider(),
            Text("คะแนนเก็บ: $keep"),
            Text("กลางภาค: $mid"),
            Text("ปลายภาค: $fin"),
            Divider(),
            Text("คะแนนรวม: $total",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("เกรด: $grade",
                style: TextStyle(fontSize: 22, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
