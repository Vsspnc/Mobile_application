import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String name;
  final String major;
  final String subject;
  final int keep;
  final int mid;
  final int fin;

  const ResultPage({
    super.key,
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

    if (total >= 80) {
      grade = "A";
    } else if (total >= 70) {
      grade = "B";
    } else if (total >= 60) {
      grade = "C";
    } else if (total >= 50) {
      grade = "D";
    } else {
      grade = "F";
    }

    Color gradeColor;
    if (grade == "A") gradeColor = Colors.green;
    else if (grade == "B") gradeColor = Colors.lightGreen;
    else if (grade == "C") gradeColor = Colors.orange;
    else if (grade == "D") gradeColor = Colors.deepOrange;
    else gradeColor = Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: const Text("ผลการคำนวณเกรด"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ===== ข้อมูลนักศึกษา =====
                  const Text(
                    "ข้อมูลนักศึกษา",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("ชื่อ: $name"),
                  Text("สาขา: $major"),
                  Text("รายวิชา: $subject"),

                  const Divider(height: 30),

                  // ===== คะแนน =====
                  const Text(
                    "รายละเอียดคะแนน",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text("คะแนนเก็บ: $keep"),
                  Text("กลางภาค: $mid"),
                  Text("ปลายภาค: $fin"),

                  const Divider(height: 30),

                  // ===== ผลลัพธ์ =====
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "คะแนนรวม",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "$total",
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "เกรด $grade",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: gradeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
