import 'package:flutter/material.dart';
import 'package:flutter_app/components/SnackBar/snacknbar.dart';
import 'package:nuvigator/next.dart';

import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: SnackbarManager.scaffoldMessengerKey,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Nuvigator(
        router: MyRouter(),
      ),
    );
  }
}
