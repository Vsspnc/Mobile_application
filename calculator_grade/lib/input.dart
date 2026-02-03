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
      appBar: AppBar(
        title: const Text("กรอกข้อมูลนักศึกษา"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            // ===== ข้อมูลนักศึกษา =====
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "ข้อมูลนักศึกษา",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "ชื่อ - นามสกุล",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ===== สาขา =====
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "สาขา",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RadioListTile<String>(
                      title: const Text("INE"),
                      value: "INE",
                      groupValue: major,
                      onChanged: (value) {
                        setState(() {
                          major = value!;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text("INET"),
                      value: "INET",
                      groupValue: major,
                      onChanged: (value) {
                        setState(() {
                          major = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ===== รายวิชา =====
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: "รายวิชา",
                    border: OutlineInputBorder(),
                  ),
                  value: subject,
                  items: subjectNames.entries.map((entry) {
                    return DropdownMenuItem<String>(
                      value: entry.key,
                      child: Text(entry.value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      subject = value;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ===== คะแนน =====
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      "คะแนน",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: keepController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "คะแนนเก็บ",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: midController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "กลางภาค",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: finalController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "ปลายภาค",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ===== ปุ่ม =====
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "คำนวณเกรด",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                if (subject == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("กรุณาเลือกรายวิชา")),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      name: nameController.text,
                      major: major,
                      subject: subjectNames[subject]!,
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
