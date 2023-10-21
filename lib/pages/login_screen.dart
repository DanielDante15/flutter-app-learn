import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/buttons/button.dart';
import 'package:flutter_app/widgets/buttons/link_button.dart';
import 'package:flutter_app/widgets/textfield.dart';
import 'package:nuvigator/next.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final formkey = GlobalKey<FormState>();

  String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  @override
  Widget build(BuildContext context) {
    final nuvigator = Nuvigator.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 50, left: 20, right: 20),
                  child: Text(
                    'Login Map Learn',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(bottom: 6),
                          child: Text('Email')),
                      MyTextField(
                        controller: usernameController,
                        labelText: 'Insert your email',
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 6),
                          child: Text('Password')),
                      MyTextField(
                        controller: passwordControler,
                        isObscure: true,
                        labelText: 'Insert your password',
                      ),
                      const SizedBox(height: 20),
                      Buttom(
                        text: 'Login',
                        onPress: () {
                          if (formkey.currentState!.validate()) {
                            nuvigator!.pushReplacementNamed('home');
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LinkButtom(
                              text: 'Forgot Password',
                              color: Colors.blue,
                              fontSize: 16,
                              onTap: () {
                                String encryptedPassword =
                                    encryptPassword(passwordControler.text);
                                print(passwordControler.text);
                                print(encryptedPassword);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: LinkButtom(
                                text: "Register",
                                color: Colors.blue,
                                fontSize: 16,
                                onTap: () => nuvigator!.open('sign-up'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
