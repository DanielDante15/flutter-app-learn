import 'package:flutter/material.dart';
import 'package:flutter_app/assets/env.dart';
import 'package:flutter_app/models/address.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AddressesApiService {
  AddressesApiService();

  String url = UrlEnviroment().env;

  Future<List<Address>> getAddresses() async {
    print('executou a funcao');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("http://$url/endereco/"),
      headers: {'Authorization': 'Bearer $token'},
    ).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw 'Error while loading delivers ';
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Address.fromJson(json)).toList();
    } else {
      Map<String, dynamic> errorMsg = json.decode(response.body);
      throw Exception(errorMsg["detail"]);
    }
  }

  Future<Address> getAddressById(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('http://$url/endereco/$id'),
      headers: {'Authorization': 'Bearer $token'},
    ).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw 'Error while loading delivers ';
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Address.fromJson(jsonData);
    } else {
      Map<String, dynamic> errorMsg = json.decode(response.body);
      throw Exception(errorMsg["detail"]);
    }
  }

  Future<Address> createAddress(Address address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http
        .post(
      Uri.parse('http://$url/enderecos'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode(address.toMap()),
    )
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw 'Error while loading delivers ';
      },
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      return Address.fromJson(jsonData);
    } else {
      Map<String, dynamic> errorMsg = json.decode(response.body);
      throw Exception(errorMsg["detail"]);
    }
  }

  Future<Address> updateAddress(int id, Address address) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http
        .put(
      Uri.parse('http://$url/enderecos/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: json.encode(address.toMap()),
    )
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw 'Error while loading delivers ';
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Address.fromJson(jsonData);
    } else {
      Map<String, dynamic> errorMsg = json.decode(response.body);
      throw Exception(errorMsg["detail"]);
    }
  }

  Future<void> deleteAddress(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.delete(
      Uri.parse('http://$url/enderecos/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    ).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw 'Error while loading delivers ';
      },
    );

    if (response.statusCode != 204) {
      Map<String, dynamic> errorMsg = json.decode(response.body);
      throw Exception(errorMsg["detail"]);
    }
  }

  Future<Circle> getDeliveryArea({int? id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (id == null) {
      final response = await http.get(
        Uri.parse('http://$url/area-entrega/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw 'Error while loading delivers ';
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        double jsonRaio = jsonData['raio'];

        double raio = jsonRaio * 700;

        final Circle areaCircle = Circle(
          circleId: const CircleId('Delivery Area'),
          center: LatLng(jsonData['centroX'], jsonData['centroY']),
          radius: raio,
          fillColor: Colors.blue.withOpacity(0.3),
          strokeWidth: 0,
        );

        return areaCircle;
      } else {
        Map<String, dynamic> errorMsg = json.decode(response.body);
        throw Exception(errorMsg["detail"]);
      }
    } else {
      final response = await http.get(
        Uri.parse('http://$url/area-entrega/$id/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw 'Error while loading delivers ';
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        double jsonRaio = jsonData['raio'];
        final Circle areaCircle = Circle(
          circleId: const CircleId('Delivery Area'),
          center: LatLng(jsonData['centroX'], jsonData['centroY']),
          radius: jsonRaio,
          fillColor: Colors.blue.withOpacity(0.3),
          strokeWidth: 0,
        );

        return areaCircle;
      } else {
        Map<String, dynamic> errorMsg = json.decode(response.body);
        throw Exception(errorMsg["detail"]);
      }
    }
  }
}
