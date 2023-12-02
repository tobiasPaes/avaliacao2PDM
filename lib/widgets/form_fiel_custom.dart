import 'package:flutter/material.dart';

class FormFieldCustom extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validate_function;
  final TextEditingController? controller;
  final TextInputType? keyboard_type;

  const FormFieldCustom({
    super.key,
    required this.labelText,
    this.validate_function,
    this.controller,
    this.keyboard_type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        keyboardType: keyboard_type,
        controller: controller,
        validator: validate_function,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
