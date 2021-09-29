import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  const UserTextField(
      {Key? key,
      required this.name,
      required this.initialValue,
      required this.inputType,
      required this.onChanged,
      required this.validator})
      : super(key: key);

  final String name;
  final String initialValue;
  final TextInputType inputType;
  final String? Function(String? value)? validator;
  final Function(String? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: name,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(10.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.lightBlue),
            borderRadius: BorderRadius.circular(10.0)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10.0)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10.0)),
      ),
      initialValue: initialValue,
      keyboardType: inputType,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
