import 'package:flutter/material.dart';
import 'shopping.dart';

enum ProductTypeEnum { Downloadable, Deliverable }

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  String _productName = '';
  String _productDes = '';

  final TextEditingController _productCon = TextEditingController();
  final TextEditingController _descon = TextEditingController();
  var _selectedChoice;
  bool? _checkBox, _listTileCheckBox = false;
  ProductTypeEnum? _productTypeEnum;




  @override
  void initState() {
    super.initState();

    _productCon.addListener(() {
      setState(() {
        _productName = _productCon.text;
      });
    });

    _descon.addListener(() {
      setState(() {
        _productDes = _descon.text;
      });
    });
  }

  @override
  void dispose() {
    _productCon.dispose();
    _descon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product detail in the form")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
            const SizedBox(height: 20),

            // Product Description
            TextFormField(
              controller: _descon,
              decoration: const InputDecoration(
                labelText: 'Product Description',
                icon: Icon(Icons.pin_drop_sharp),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Checkbox
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.blue,
              tristate: true,
              value: _checkBox,
              onChanged: (val) {
                setState(() {
                  _checkBox = val;
                });
              },
            ),

            // checkbox 2
            CheckboxListTile(
              value: _listTileCheckBox,
              title: Text("Top_Product"),
              onChanged: (val) {
                setState(() {
                  _listTileCheckBox = val;
                });
              },
            ),

            Radio(value: null, groupValue: null, onChanged: null),
            RadioListTile(value: null, groupValue: null, onChanged: null),

            SizedBox(height: 20),
            myBtn(context),
            SizedBox(height: 40.0),

            ListTile(
              title: Text('1'),
              leading: Radio(value: 1, 
              groupValue: _selectedChoice, 
              onChanged: (value) {
                setState(() {
                  _selectedChoice = 1;
                });
              }),
            ),
            ListTile(
              title: Text('2'),
              leading: Radio(value: 2, 
              groupValue: _selectedChoice, 
              onChanged: (value) {
                setState(() {
                  _selectedChoice = 2;
                });
              }),
            ),
            ListTile(
              title: Text('3'),
              leading: Radio(value: 3, 
              groupValue: _selectedChoice, 
              onChanged: (value) {
                setState(() {
                  _selectedChoice = 3;
                });
              }),
            ),

            // Button
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormShopping(
                      productName: _productName,
                      customerName: _productDes,
                    ),
                  ),
                );
              },
              child: const Text("SUB"),
            ),

            RadioListTile<ProductTypeEnum>(
              title: Text(ProductTypeEnum.Deliverable.name),
              value: ProductTypeEnum.Downloadable,
              groupValue: _productTypeEnum,
              onChanged: (val) {
                setState(() {
                  _productTypeEnum = val;
                });
              }),
            RadioListTile<ProductTypeEnum>(
              title: Text(ProductTypeEnum.Deliverable.name),
              value: ProductTypeEnum.Deliverable,
              groupValue: _productTypeEnum,
              onChanged: (val) {
                setState(() {
                  _productTypeEnum = val;
                });
              }),

            const SizedBox(height: 16),
            Text("Product : $_productName"),
            Text("Description: $_productDes"),
          ],
        ),
      ),
    );
  }
  Center myBtn(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormShopping(
                productName: _productName,
                customerName: _productDes,
              ),
            ),
          );
        },
        child: const Text("SUBMIT"),
      ),
    );
  }
}

class MytextField extends StatelessWidget {
 const MytextField({
  Key? key,
  required this.fieldName,
  required this.myController,
  this.myIcon = Icons.verified_user_outlined,
  this.prefixIconColor = Colors.blueAccent,
  }) : super(key: key);

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;

@override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      decoration: InputDecoration(
        labelText: fieldName,
        icon: Icon(
          myIcon,
          color: prefixIconColor,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple.shade300,
            width: 2.0,
          ),
        ),
        labelStyle: const TextStyle(
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
