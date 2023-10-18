import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text('Login Screen'),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          Buttom(onpress: () {}, text: 'Login')
        ],
      )),
    );
  }
}
