import 'package:flutter/material.dart';

class Buttom extends StatelessWidget {
  const Buttom({
    super.key,
    required this.onpress,
    required this.text,
  });

  final void Function() onpress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onpress,
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
