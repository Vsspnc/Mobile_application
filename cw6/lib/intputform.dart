import 'package:flutter/material.dart';
import 'shopping.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String _productName = '';
  String _customerName = '';

  final TextEditingController _productCon = TextEditingController();
  final TextEditingController _customerCon = TextEditingController();

  @override
  void initState() {
    super.initState();

    _productCon.addListener(() {
      setState(() {
        _productName = _productCon.text;
      });
    });

    _customerCon.addListener(() {
      setState(() {
        _customerName = _customerCon.text;
      });
    });
  }

  @override
  void dispose() {
    _productCon.dispose();
    _customerCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("INPUT FORM")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Product Name
            TextFormField(
              controller: _productCon,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                icon: Icon(Icons.shopping_cart),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Customer Name
            TextFormField(
              controller: _customerCon,
              decoration: const InputDecoration(
                labelText: 'Customer Name',
                icon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Button
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormShopping(
                      productName: _productName,
                      customerName: _customerName,
                    ),
                  ),
                );
              },
              child: const Text("SUB"),
            ),

            const SizedBox(height: 16),
            Text("Product : $_productName"),
            Text("Customer : $_customerName"),
          ],
        ),
      ),
    );
  }
}
