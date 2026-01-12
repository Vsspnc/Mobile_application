import 'package:flutter/material.dart';
import 'shopping.dart';
import 'my_radio_buttom.dart';
import 'product_type_enum.dart';


class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  // Controllers
  final TextEditingController _productCon = TextEditingController();
  final TextEditingController _descon = TextEditingController();

  // State variables
  String _productName = '';
  String _productDes = '';

  bool _checkBox = false;
  bool _listTileCheckBox = false;
  int? _selectedChoice;
  ProductTypeEnum? _productTypeEnum;

final List<String> _productSizeList = ['S', 'M', 'L', 'XL'];
late String _selectedVal;

  _InputFormState() {
    _selectedVal = _productSizeList[0];
  }
  


  @override
  void initState() {
    super.initState();
    _selectedVal = _productSizeList.first;

    _productCon.addListener(() {
      setState(() => _productName = _productCon.text);
    });

    _descon.addListener(() {
      setState(() => _productDes = _descon.text);
    });
  }

  @override
  void dispose() {
    _productCon.dispose();
    _descon.dispose();
    super.dispose();
  }

  void submitForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormShopping(
          productName: _productName,
          customerName: _productDes,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            /// Product name
            MytextField(
              fieldName: 'Product Name',
              myController: _productCon,
              myIcon: Icons.shopping_cart,
            ),
            const SizedBox(height: 16),

            /// Product description
            MytextField(
              fieldName: 'Product Description',
              myController: _descon,
              myIcon: Icons.description,
            ),
            const SizedBox(height: 20),

            /// Checkboxes
            CheckboxListTile(
              title: const Text('Available'),
              value: _checkBox,
              onChanged: (val) {
                setState(() => _checkBox = val!);
              },
            ),

            CheckboxListTile(
              title: const Text('Top Product'),
              value: _listTileCheckBox,
              onChanged: (val) {
                setState(() => _listTileCheckBox = val!);
              },
            ),

          
          

            const Divider(),

          //   /// Radio numbers
          //   const Text(
          //     'Select Level',
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          //  ListTile( 
          //   title: Text('1'), 
          //   leading: Radio(value: 1, 
          //   groupValue: _selectedChoice, 
          //   onChanged: (value) { 
          //     setState(() { 
          //       _selectedChoice = 1; 
          //       }); 
          //     }),
          //   ),
          //   ListTile( 
          //    title: Text('2'),
          //    leading: Radio(value: 2,
          //    groupValue: _selectedChoice,
          //    onChanged: (value) { 
          //     setState(() { 
          //       _selectedChoice = 2; 
          //       });
          //     }),
          //   ),
          //   ListTile( 
          //     title: Text('3'), 
          //     leading: Radio(value: 3, 
          //     groupValue: _selectedChoice, 
          //     onChanged: (value) { 
          //       setState(() { 
          //         _selectedChoice = 3; 
          //         }); 
          //       }), 
          //     ),
          //   const Divider(),

           
            const Text(
              'Product Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            MyRadioButtom(
              title: ProductTypeEnum.Deliverable.name, 
              value: ProductTypeEnum.Deliverable, 
              selectedProductType: _productTypeEnum, 
              onChanged: (value) { 
                setState(() { 
                  _productTypeEnum = value; 
                }); 
              }),
            MyRadioButtom(
              title: ProductTypeEnum.Downloadable.name, 
              value: ProductTypeEnum.Downloadable, 
              selectedProductType: _productTypeEnum, 
              onChanged: (value) { 
                setState(() { 
                  _productTypeEnum = value; 
                }); 
              }),
            const Divider(),
            const Text(
              'Select Product Size',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

          DropdownButtonFormField<String>(
              value: _selectedVal,

              items: _productSizeList.map((e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                );
              }).toList(),

              onChanged: (value) {
                setState(() {
                  _selectedVal = value!;
                });
              },

              // 🔽 icon
              icon: const Icon(
                Icons.arrow_drop_down_circle,
                color: Colors.deepPurple,
              ),

              // 🎨 สี dropdown
              dropdownColor: Colors.deepPurple.shade50,

              // 🧾 decoration
              decoration: const InputDecoration(
                labelText: "Product Sizes",
                prefixIcon: Icon(
                  Icons.accessibility_new_rounded,
                  color: Colors.deepPurple,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            /// Submit button
            Center(
              child: ElevatedButton(
                onPressed: submitForm,
                child: const Text("SUBMIT"),
              ),
            ),

            const SizedBox(height: 20),

            /// Preview text
            Text("Product : $_productName"),
            // Text("Description : $_productDes"),
            // Text("Available : $_checkBox"),
            // Text("Top Product : $_listTileCheckBox"),
            // Text("Product Type : ${_productTypeEnum?.name}"),
            Text("Product Size : $_selectedVal"),
          ],
        ),
      ),
    );
  }
}

class MytextField extends StatelessWidget {
  const MytextField({
    super.key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  });

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
        icon: Icon(myIcon, color: prefixIconColor),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple.shade300,
            width: 2,
          ),
        ),
      ),
    );
  }
}
