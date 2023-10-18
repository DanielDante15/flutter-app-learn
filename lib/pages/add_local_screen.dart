import 'package:flutter/material.dart';

class AddLocalScreen extends StatelessWidget {
  const AddLocalScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Local Screen')),
      body: Center(child: Text('Tela Adicionar Local')),
    );
  }
}
