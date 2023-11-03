import 'dart:convert';
import 'package:flutter_app/assets/env.dart';
import 'package:flutter_app/components/SnackBar/snacknbar.dart';
import 'package:flutter_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends UrlEnviroment {
  Future<Map<String, dynamic>> login(String username, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final response = await http
        .post(Uri.parse('http://${super.env}/login'),
            headers: {'content-type': 'application/json'},
            body: json.encode({"username": username, "password": password}))
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        SnackbarManager()
            .showErrorSnackbar('Username or password are incorrects');
        throw 'Error while retrieving data';
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> resBody =
          jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
      sharedPreferences.setString('token', resBody['token']);
      sharedPreferences.setString('user', jsonEncode(resBody['usuario']));

      final user = User.fromJson(resBody['usuario']);
      print('ate aqui foi');

      return {"isAuth": true, "user": user};
    } else {
      SnackbarManager()
          .showErrorSnackbar('Username or password are incorrects');
      return {"isAuth": false};
    }
  }

  Future<Map<String, dynamic>> isAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      final usuario = prefs.getString('user');
      if (usuario != null) {
        final json = jsonDecode(usuario);
        final user = User.fromJson(json);
        return {"isAuth": true, "user": user};
      }
      return {"isAuth": false};
    } else {
      return {"isAuth": false};
    }
  }
}
