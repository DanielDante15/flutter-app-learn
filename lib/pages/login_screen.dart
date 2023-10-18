import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/button.dart';
import 'package:flutter_app/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Login Map Learn',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Text('Email')),
                  MyTextField(controller: usernameController),
                  const SizedBox(height: 15),
                  const Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Text('Password')),
                  MyTextField(controller: passwordControler),
                  const SizedBox(height: 20),
                  Buttom(onpress: () {}, text: 'Login')
                ],
              ),
              const SizedBox(),
              const SizedBox(),
            ],
          ),
        )),
      ),
    );
  }
}
