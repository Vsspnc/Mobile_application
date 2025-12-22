import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Moneybox extends StatelessWidget {
  String title;
  double amount;
  double sizeConHeight;
  Color boxcolor;
  Moneybox(this.title, this.amount, this.sizeConHeight, this.boxcolor);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: boxcolor,
        borderRadius: BorderRadius.circular(20)),
      height: sizeConHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Expanded(
          
          child: Text('${NumberFormat("#,###.###").format(amount)}',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
        ),
        Expanded(
          child: Text(amount.toString(),
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.right),
        ),
      ],),
    );
  }
}