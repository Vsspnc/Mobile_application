import 'package:flutter/material.dart';
import 'product_type_enum.dart';

class MyRadioButtom extends StatelessWidget {
  const MyRadioButtom({
    super.key,
    required this.title,
    required this.value,
    required this.selectedProductType,
    required this.onChanged,
  });

  final String title;
  final ProductTypeEnum value;
  final ProductTypeEnum? selectedProductType;
  final ValueChanged<ProductTypeEnum?> onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<ProductTypeEnum>(
      title: Text(title),
      value: value,
      groupValue: selectedProductType,
      onChanged: onChanged,
    );
  }
}

