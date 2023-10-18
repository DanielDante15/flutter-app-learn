// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/login_screen.dart';
import 'package:nuvigator/next.dart';

class LoginRoute extends NuRoute {
  @override
  String get path => 'login';

  @override
  ScreenType? get screenType => materialScreenType;

  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return const LoginScreen();
  }
}
