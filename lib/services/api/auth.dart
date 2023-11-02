import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/assets/env.dart';
import 'package:flutter_app/components/SnackBar/snacknbar.dart';
import 'package:http/http.dart' as http;
import 'package:nuvigator/next.dart';

class Auth extends UrlEnviroment {
  Future<bool> login(
      String username, String password, BuildContext context) async {
    final nuvigator = Nuvigator.of(context);
    final response = await http
        .post(Uri.parse('http://${super.env}/login'),
            headers: {'content-type': 'application/json'},
            body: json.encode({"username": username, "password": password}))
        .timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        SnackbarManager()
            .showErrorSnackbar('Username or password are incorrects');
        throw 'Error while retrieving data';
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      nuvigator!.open('home');
      return true;
    } else {
      SnackbarManager()
          .showErrorSnackbar('Username or password are incorrects');
      print(response.body);
      return false;
    }
  }

  // Future<Address> createAddress(Address address) async {
  //   final response = await http
  //       .post(
  //     Uri.parse('http://${super.env}/enderecos'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode(address.toMap()),
  //   )
  //       .timeout(
  //     const Duration(seconds: 30),
  //     onTimeout: () {
  //       throw 'Error while loading delivers ';
  //     },
  //   );

  //   if (response.statusCode == 201) {
  //     final jsonData = json.decode(response.body);
  //     return Address.fromJson(jsonData);
  //   } else {
  //     Map<String, dynamic> errorMsg = json.decode(response.body);
  //     throw Exception(errorMsg["detail"]);
  //   }
  // }
}
