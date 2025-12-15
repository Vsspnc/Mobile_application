import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "MyApp", home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const double spaceBtwBtn = 10;
  String num1 = ''; 
  String num2 = ''; 
  String operator = ''; 
  String showVal = '0'; 
  bool isResultDisplayed = false; 

  
  void appendNumber(String digit) {
    setState(() {
      if (isResultDisplayed) {
        num1 = digit;
        num2 = '';
        operator = '';
        isResultDisplayed = false;
        showVal = num1;
        return;
      }
      
      if (operator.isEmpty) {
        if (num1 == '0') num1 = '';
        num1 += digit;
        showVal = num1.isEmpty ? '0' : num1;
      } else {
        if (num2 == '0') num2 = ''; 
        num2 += digit;
        showVal = num2.isEmpty ? '0' : num2;
      }
    });
  }

  void setOperator(String op) {
    setState(() {
      if (num1.isEmpty) num1 = '0'; 
      operator = op;
      num2 = ''; 
      isResultDisplayed = false;
      if (op == '%') {
        showVal = '0'; 
      }
    });
  }
  
  void deleteDigit() {
    setState(() {
      if (isResultDisplayed) {
        resetAll();
        return;
      }
      
      if (operator.isEmpty) {
        if (num1.isNotEmpty) {
          num1 = num1.substring(0, num1.length - 1);
          showVal = num1.isEmpty ? '0' : num1;
        }
      } else {
        if (num2.isNotEmpty) {
          num2 = num2.substring(0, num2.length - 1);
          showVal = num2.isEmpty ? '0' : num2;
        } else {
       }
      }
    });
  }


  void calculateResult() {
    setState(() {
      if (num1.isEmpty) return;

      double? n1 = double.tryParse(num1);
      double? n2 = double.tryParse(num2);
      double result = 0;


      if (n1 == null) {
        showVal = 'Error';
        resetStateAfterError();
        return;
      }

      if (operator == '+' && n2 != null) result = n1 + n2;
      else if (operator == '-' && n2 != null) result = n1 - n2;
      else if (operator == '*' && n2 != null) result = n1 * n2;
      else if (operator == '/' && n2 != null) {
        if (n2 == 0) {
          showVal = 'Div by 0';
          resetStateAfterError();
          return;
        }
        result = n1 / n2;
      }
 
      else if (operator == '%' && n2 != null) {
        result = (n1 / 100) * n2;
      }

      else if (operator == '^' && n2 != null) {
        result = pow(n1, n2).toDouble();
      }
      else if (operator == '√') {
        result = sqrt(n1);
      }
      else if (operator.isNotEmpty && n2 == null) {
         showVal = num1; 
         return; 
      }
      else {
        showVal = num1;
        return;
      }
      String resultStr = result.toString();
      if (resultStr.endsWith('.0')) {
        showVal = result.toInt().toString();
      } else {
        showVal = result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 4);
      }

      num1 = showVal; 
      num2 = '';
      operator = '';
      isResultDisplayed = true;
    });
  }

  void resetAll() {
    setState(() {
      num1 = '';
      num2 = '';
      showVal = '0';
      operator = '';
      isResultDisplayed = false;
    });
  }


  void resetStateAfterError() {
    num1 = '';
    num2 = '';
    operator = '';
    isResultDisplayed = false;
  }


  Widget buildDigitButton(String digit) {
    return FloatingActionButton(
      onPressed: () => appendNumber(digit),
      heroTag: 'btn$digit',
      child: Text(digit),
    );
  }

  Widget buildOperatorButton(String op) {
    return FloatingActionButton(
      onPressed: () => setOperator(op),
      heroTag: 'btn$op',
      child: Text(op, style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
    );
  }
  
  Widget buildSpecialButton(String label, VoidCallback onPressed, {Color color = Colors.deepPurpleAccent}) {
    return FloatingActionButton(
      onPressed: onPressed,
      heroTag: 'btn$label',
      backgroundColor: color,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Calculator"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(showVal, style: const TextStyle(fontSize: 60, color: Colors.red)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDigitButton("7"),
                SizedBox(width: spaceBtwBtn),
                buildDigitButton("8"),
                SizedBox(width: spaceBtwBtn),
                buildDigitButton("9"),
                SizedBox(width: spaceBtwBtn),
                buildOperatorButton("+"),
              ],
            ),
            SizedBox(height: spaceBtwBtn),
            
            

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDigitButton("4"),
                SizedBox(width: spaceBtwBtn),
                buildDigitButton("5"),
                SizedBox(width: spaceBtwBtn),
                buildDigitButton("6"),
                SizedBox(width: spaceBtwBtn),
                buildOperatorButton("-"),
              ],
            ),
            SizedBox(height: spaceBtwBtn),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDigitButton("1"),
                SizedBox(width: spaceBtwBtn),
                buildDigitButton("2"),
                SizedBox(width: spaceBtwBtn), 
                buildDigitButton("3"),
                SizedBox(width: spaceBtwBtn),
                buildOperatorButton("*"),
              ],
            ),
            SizedBox(height: spaceBtwBtn),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDigitButton("0"),
                SizedBox(width: spaceBtwBtn),
                buildSpecialButton('C', resetAll, color: Colors.red), 
                SizedBox(width: spaceBtwBtn),
                buildSpecialButton('=', calculateResult, color: Colors.blue), 
                SizedBox(width: spaceBtwBtn),
                buildOperatorButton("/"),            
              ],
            ),
            SizedBox(height: spaceBtwBtn),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSpecialButton('DEL', deleteDigit, color: Colors.blueGrey), 
                SizedBox(width: spaceBtwBtn),
                buildSpecialButton('%', () => setOperator('%'),), 
                SizedBox(width: spaceBtwBtn),
                 buildSpecialButton('^', () => setOperator('^')), 
                SizedBox(width: spaceBtwBtn),
                buildSpecialButton('√', () => setOperator('√')), 
              ],
            ),
          ],
        ),
      ),
    );
  }
}