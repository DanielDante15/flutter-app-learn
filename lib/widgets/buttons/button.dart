import 'package:flutter/material.dart';

class Buttom extends StatelessWidget {
  const Buttom({
    super.key,
    required this.onPress,
    required this.text,
  });

  final void Function() onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPress,
            child: Text(text),
          ),
        ),
      ],
    );
  }
}
