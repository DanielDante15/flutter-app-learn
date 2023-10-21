import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/address.dart';
import 'package:flutter_app/widgets/lists/dashboard_list_view.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    fetchAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suas Entregas'),
      ),
      body: SafeArea(
          child: FutureBuilder<List<Address>>(
        future: fetchAddresses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  fetchAddresses();
                });
              },
              child: DashboardListView(data: snapshot.data));
        },
      )),
    );
  }
}

Future<List<Address>> fetchAddresses() async {
  final response =
      await http.get(Uri.parse('http://192.168.0.13:8000/enderecos/'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    final List<Address> addressesList =
        jsonData.map((e) => Address.fromJson(e)).toList();
    print(jsonData);
    return addressesList;
  } else {
    return List<Address>.empty();
  }
}
