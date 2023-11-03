import 'package:flutter/material.dart';
import 'package:flutter_app/components/Button/button.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/api/addresses_api.dart';
import 'package:flutter_app/models/address.dart';
import 'package:flutter_app/components/List/dashboard_list_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, this.user});
  final User? user;

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
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: const Text('Your tasks'),
        ),
      ),
      body: SafeArea(
          child: FutureBuilder<List<Address>>(
        future: fetchAddresses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${snapshot.error}'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Buttom(
                      onPress: () async {
                        setState(() {
                          fetchAddresses();
                        });
                      },
                      text: 'Refresh'),
                )
              ],
            ));
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
