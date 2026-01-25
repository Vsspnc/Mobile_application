// กรอกข้อมูล
import 'package:flutter/material.dart';
import 'result.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final nameController = TextEditingController();
  final keepController = TextEditingController();
  final midController = TextEditingController();
  final finalController = TextEditingController();

  String major = "INE";
  String? subject;

  Map<String, String> subjectNames = {
    "CS101": "Mobile Programming",
    "CS102": "Web Programming",
    "CS103": "Database System",
    "CS104": "Computer Network",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("กรอกข้อมูลนักศึกษา")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "ชื่อ - นามสกุล"),
            ),

            SizedBox(height: 10),
            Text("สาขา"),
            RadioListTile<String>(
              title: Text("INE"),
              value: "INE",
              // ignore: deprecated_member_use
              groupValue: major,
              // ignore: deprecated_member_use
              onChanged: (String? value) {
                setState(() {
                  major = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: Text("INET"),
              value: "INET",
              // ignore: deprecated_member_use
              groupValue: major,
              // ignore: deprecated_member_use
              onChanged: (String? value) {
                setState(() {
                  major = value!;
                });
              },
            ),

            DropdownButton<String>(
  hint: Text("เลือกรายวิชา"),
  value: subject,
  items: subjectNames.entries.map((entry) {
    return DropdownMenuItem(
      value: entry.key,        // ใช้ CS101 ภายใน
      child: Text(entry.value) // 👈 แสดงเฉพาะชื่อวิชา
    );
  }).toList(),
  onChanged: (value) {
    setState(() {
      subject = value;
    });
  },
),


            TextField(
              controller: keepController,
              decoration: InputDecoration(labelText: "คะแนนเก็บ"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: midController,
              decoration: InputDecoration(labelText: "กลางภาค"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: finalController,
              decoration: InputDecoration(labelText: "ปลายภาค"),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),
            ElevatedButton(
              child: Text("คำนวณเกรด"),
             onPressed: () {
  if (subject == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("กรุณาเลือกรายวิชา")),
    );
    return;
  }

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ResultPage(
        name: nameController.text,
        major: major,
        subject: subjectNames[subject]!, // 👈 ส่งชื่อวิชา
        keep: int.parse(keepController.text),
        mid: int.parse(midController.text),
        fin: int.parse(finalController.text),
      ),
    ),
  );
},

            ),
          ],
        ),
      ),
    );
  }
}
