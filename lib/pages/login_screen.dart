import 'package:flutter/material.dart';
import 'package:flutter_app/components/Button/button.dart';
import 'package:flutter_app/components/Button/link_button.dart';
import 'package:flutter_app/components/TextField/textfield.dart';
import 'package:flutter_app/services/api/auth.dart';
import 'package:flutter_app/validators/password_validator.dart';
import 'package:nuvigator/next.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<Map<String, dynamic>>? _loginFuture;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();
  final formkey = GlobalKey<FormState>();

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
                        validator: (value) => passwordValidator(value),
                        controller: passwordControler,
                        isObscure: true,
                        labelText: 'Insert your password',
                      ),
                      const SizedBox(height: 20),
                      FutureBuilder<Map<String, dynamic>>(
                        future: _loginFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return Buttom(
                            text: 'Login',
                            onPress: () async {
                              if (formkey.currentState!.validate()) {
                                setState(() {
                                  _loginFuture = Auth()
                                      .login(usernameController.text,
                                          passwordControler.text)
                                      .then((value) {
                                    if (value['isAuth'] == true) {
                                      nuvigator!.pushReplacementNamed(
                                        'home',
                                        arguments: {'user': value['user']},
                                      );
                                      return {};
                                    }
                                    passwordControler.clear();
                                    return {};
                                  });
                                });
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LinkButtom(
                              text: 'Forgot Password',
                              color: Colors.blue,
                              fontSize: 16,
                              onTap: () {},
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
