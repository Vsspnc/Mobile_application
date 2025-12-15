import 'package:flutter/material.dart';

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
  static double space_btw_btn = 10;
  int num = 0;
  String num1 = '';
  String num2 = '';
  String operator = '';
  String showVal = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Calculator"))),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(showVal, style: TextStyle(fontSize: 60, color: Colors.red)),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: .center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "7";
                        showVal = num1;
                      } else {
                        num2 += "7";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("7"),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "8";
                        showVal = num1;
                      } else {
                        num2 += "8";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("8"),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "9";
                        showVal = num1;
                      } else {
                        num2 += "9";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("9"),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "+";
                    });
                  },
                  child: Text("+"),
                ),
              ],
            ),
            SizedBox(height: space_btw_btn),
            Row(
              mainAxisAlignment: .center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "4";
                        showVal = num1;
                      } else {
                        num2 += "4";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("4"),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "5";
                        showVal = num1;
                      } else {
                        num2 += "5";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("5"),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "6";
                        showVal = num1;
                      } else {
                        num2 += "6";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("6"),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "-";
                    });
                  },
                  child: Text("-"),
                ),
              ],
            ),
            SizedBox(height: space_btw_btn),
            Row(
              mainAxisAlignment: .center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "1";
                        showVal = num1;
                      } else {
                        num2 += "1";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("1"),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "2";
                        showVal = num1;
                      } else {
                        num2 += "2";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("2"),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "3";
                        showVal = num1;
                      } else {
                        num2 += "3";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("3"),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "*";
                    });
                  },
                  child: Text("*"),
                ),
              ],
            ),
            SizedBox(height: space_btw_btn),
            Row(
              mainAxisAlignment: .center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (num1 != '' && operator.isEmpty) {
                        num1 += "0";
                        showVal = num1;
                      } else if (num2 != '') {
                        num2 += "0";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("0"),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  backgroundColor: Colors.deepPurpleAccent,
                  onPressed: () {
                    setState(() {
                      num1 = '';
                      num2 = '';
                      showVal = '0';
                      operator = '';
                    });
                  },
                  child: Text("c", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (num == '' || num2 == '') return;
                      double newNum1 = double.parse(num1);
                      double newNum2 = double.parse(num2);
                      double result = 0;
                      if (operator == "+") result = newNum1 + newNum2;
                      else if (operator == "-") result = newNum1 - newNum2;
                      else if (operator == "*") result = newNum1 * newNum2;
                      else if (operator == "/") {
                        result = (newNum1 / newNum2);
                        result = double.parse(result.toStringAsFixed(4));
                      };

                      showVal = result.toString();
                      num1 = '';
                      num2 = '';
                      operator = '';
                    });
                  },
                  child: Text("="),
                ),
                SizedBox(width: space_btw_btn),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "/";
                    });
                  },
                  child: Text("/"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}