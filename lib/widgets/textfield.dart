import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );
  }
}
