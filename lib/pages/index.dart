import 'package:flutter/material.dart';
import 'package:flutter_app/services/api/auth.dart';
import 'package:nuvigator/next.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  void initState() {
    final nuvigator = Nuvigator.of(context);
    super.initState();
    Auth().isAuth().then((value) {
      if (value['isAuth']) {
        nuvigator!
            .pushReplacementNamed('home', arguments: {'user': value['user']});
      } else {
        nuvigator!.pushReplacementNamed('login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
