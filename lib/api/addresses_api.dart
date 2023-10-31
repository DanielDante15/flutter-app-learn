import 'package:flutter/material.dart';
import 'package:flutter_app/env.dart';
import 'package:flutter_app/models/address.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddressesApiService {
  AddressesApiService();

  String url = UrlEnviroment().env;

  Future<List<Address>> getAddresses() async {
    final response =
        await http.get(Uri.parse("http://$url:8000/enderecos/")).timeout(
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
    final response =
        await http.get(Uri.parse('http://$url:8000/enderecos/$id')).timeout(
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
    final response = await http
        .post(
      Uri.parse('http://$url:8000/enderecos'),
      headers: {'Content-Type': 'application/json'},
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
    final response = await http
        .put(
      Uri.parse('http://$url:8000/enderecos/$id'),
      headers: {'Content-Type': 'application/json'},
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
    final response =
        await http.delete(Uri.parse('http://$url:8000/enderecos/$id')).timeout(
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
    if (id == null) {
      final response =
          await http.get(Uri.parse('http://$url:8000/area-entrega/')).timeout(
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
      final response = await http
          .get(Uri.parse('http://$url:8000/area-entrega/$id/'))
          .timeout(
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
