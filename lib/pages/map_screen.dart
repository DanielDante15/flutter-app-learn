import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map Screen')),
      body: Center(
          child: Column(
        children: [
          Text('Tela do Mapa'),
          ElevatedButton(
              onPressed: () {
                Nuvigator.of(context)!.open('login');
              },
              child: Text('Ir para Login'))
        ],
      )),
    );
  }
}
