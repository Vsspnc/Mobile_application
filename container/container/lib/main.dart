import 'package:flutter/material.dart';
import 'moneybox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class InputNew extends StatelessWidget {
  const InputNew({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Account Name',
        labelStyle:
          WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
            final Color color = states.contains(WidgetState.error)
              ? Theme.of(context).colorScheme.error
              : Colors.white;
            return TextStyle(color: color, letterSpacing: 1.3);
          }),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.always,
    );
  }
}








class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Container"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 120,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20)
              ),
              child: InputNew(),
            ),
            Moneybox("ยอดคงเหลือ", 20000, 100, Colors.green),
            const SizedBox(height: 5),
            Moneybox("รายรับ", 30000, 100, Colors.blue),
            const SizedBox(height: 5),
            Moneybox("รายจ่าย", 15000, 100, const Color.fromARGB(255, 231, 114, 18)),
            const SizedBox(height: 5),
            Moneybox("ค้างจ่าย", 5000, 100, Colors.purple),
            const SizedBox(height: 10), 
            
            
            TextButton(
              onPressed: () {}, 
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Colors.green,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text("button"),
            ),
          ],
        ),
      ),
    );
  }
}

