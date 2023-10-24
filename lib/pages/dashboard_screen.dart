import 'package:flutter/material.dart';
import 'package:flutter_app/api/addresses_api.dart';
import 'package:flutter_app/models/address.dart';
import 'package:flutter_app/widgets/lists/dashboard_list_view.dart';

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
            return Center(child: Text('${snapshot.error}'));
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
  return AddressesApiService().getAddresses();
}
