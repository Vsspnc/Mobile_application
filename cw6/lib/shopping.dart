import 'package:flutter/material.dart';

class FormShopping extends StatelessWidget {
  final String productName;
  final String customerName;

  const FormShopping({
    super.key,
    required this.productName,
    required this.customerName,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SHOPPING')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: Text("Product : $productName"),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text("Customer : $customerName"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("GO BACK"),
            ),
          ],
        ),
      ),
    );
  }
}
