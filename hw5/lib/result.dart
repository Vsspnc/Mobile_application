import 'dart:math';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String userNumber;
  final int buyMoney;

  const ResultPage({
    super.key,
    required this.userNumber,
    required this.buyMoney,
  });

  @override
  Widget build(BuildContext context) {
    int rand = Random().nextInt(1000);
    String winNumber = rand.toString().padLeft(3, '0');

    bool isWin = userNumber == winNumber;
    int reward = isWin ? buyMoney * 100 : 0;

    return Scaffold(
      appBar: AppBar(title: const Text('ผลการออกรางวัล')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('เลขที่คุณซื้อ คือ $userNumber',
                  style: const TextStyle(fontSize: 18)),
              Text('จำนวนเงินที่คุณซื้อ คือ $buyMoney บาท',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
        
              Text('* เลขที่ออก คือ $winNumber',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
        
              Text(
                isWin
                    ? '* ยินดีด้วยคุณถูกรางวัล'
                    : '* เสียใจด้วย คุณไม่ถูกรางวัล',
                style: TextStyle(
                  fontSize: 18,
                  color: isWin ? Colors.green : Colors.red,
                ),
              ),
        
              if (isWin)
                Text(
                  '* รับเงินรางวัล $reward บาท',
                  style: const TextStyle(fontSize: 18),
                ),
        
              const SizedBox(height: 30),
        
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('กลับหน้าหลัก'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}