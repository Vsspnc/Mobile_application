import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 177, 177),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(24),
                child: const Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 48),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  buildButtonRow(['C', '%', '/', '×'], isOperatorRow: true),
                  buildButtonRow(['7', '8', '9', '-']),
                  buildButtonRow(['4', '5', '6', '+']),
                  buildButtonRow(['1', '2', '3', '=']),
                  buildButtonRow(['0'], isLastRow: true),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> labels, {bool isOperatorRow = false, bool isLastRow = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: labels.map((label) {
        return Expanded(
          flex: label == '0' && isLastRow ? 2 : 1,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: _getButtonColor(label),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Color _getButtonColor(String label) {
    const operatorButtons = ['+', '-', '×', '/', '=', '%'];
    if (label == 'C') return Colors.redAccent;
    if (operatorButtons.contains(label)) return Colors.orange;
    return Colors.grey[850]!;
  }
}
