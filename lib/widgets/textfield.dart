import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      this.isObscure,
      this.validator,
      this.labelText});

  final TextEditingController? controller;
  final bool? isObscure;
  final String? Function(String?)? validator;
  final String? labelText;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isObscure ?? false,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never),
    );
  }
}
