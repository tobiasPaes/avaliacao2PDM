import 'package:flutter/material.dart';

class FormFieldCustom extends StatelessWidget {
  final String labelText;
  final String? Function(String?)? validateFunction;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const FormFieldCustom({
    super.key,
    required this.labelText,
    this.validateFunction,
    this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        validator: validateFunction,
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
