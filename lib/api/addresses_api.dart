import 'package:flutter_app/env.dart';
import 'package:flutter_app/models/address.dart';
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
        await http.get(Uri.parse('http://$url:8000/enderecos/$id'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Address.fromJson(jsonData);
    } else {
      throw Exception('Failed to load address');
    }
  }

  Future<Address> createAddress(Address address) async {
    final response = await http.post(
      Uri.parse('http://$url:8000/enderecos'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(address.toMap()),
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      return Address.fromJson(jsonData);
    } else {
      throw Exception('Failed to create address');
    }
  }

  Future<Address> updateAddress(int id, Address address) async {
    final response = await http.put(
      Uri.parse('http://$url:8000/enderecos/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(address.toMap()),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Address.fromJson(jsonData);
    } else {
      throw Exception('Failed to update address');
    }
  }

  Future<void> deleteAddress(int id) async {
    final response =
        await http.delete(Uri.parse('http://$url:8000/enderecos/$id'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete address');
    }
  }
}
