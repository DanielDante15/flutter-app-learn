import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/pages/add_local_screen.dart';
import 'package:flutter_app/pages/dashboard_screen.dart';
import 'package:flutter_app/pages/map_screen.dart';
import 'package:flutter_app/pages/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.usuario,
  });

  final User usuario;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashboardScreen(user: widget.usuario),
      const MapScreen(),
      const AddLocalScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Adicionar Local',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
