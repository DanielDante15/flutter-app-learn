import 'package:flutter/material.dart';
import 'package:flutter_app/models/address.dart';
import 'package:flutter_app/widgets/buttons/link_button.dart';
import 'package:nuvigator/next.dart';

class DashboardListView extends StatefulWidget {
  const DashboardListView({super.key, required this.data});

  @override
  State<DashboardListView> createState() => _DashboardListViewState();
  final List<Address>? data;
}

class _DashboardListViewState extends State<DashboardListView> {
  @override
  Widget build(BuildContext context) {
    final address = widget.data;
    final nuvigator = Nuvigator.of(context);

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: address?.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Card(child: Text('Finalizar Viagem'))));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${address?[index].logradouro}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Cliente${index + 1}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          LinkButtom(
                            text: 'See Route',
                            onTap: () {
                              nuvigator!.open('map');
                            },
                            fontSize: 14,
                            color: const Color(0xff6750a4),
                          )
                        ],
                      ),
                    ],
                  ),
                  Text('8.6 Km')
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
