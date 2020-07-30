
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(this.inputType, {this.label, this.isAutofocusOn, this.obscureText});
  final String label;
  final bool isAutofocusOn;
  final TextInputType inputType;
  final obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: isAutofocusOn,
      keyboardType: inputType,
      obscureText: obscureText,
      style: TextStyle(color: Colors.black, fontFamily: 'Verto Medium'),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          gapPadding: 2,
        ),
        labelText: label,
      ),
    );
  }
}