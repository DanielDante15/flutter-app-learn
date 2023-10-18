import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Informações do usuário')),
          ElevatedButton(
              onPressed: () {
                Nuvigator.of(context)!.pushReplacementNamed('login');
              },
              child: const Text('Logout'))
        ],
      ),
    );
  }
}
