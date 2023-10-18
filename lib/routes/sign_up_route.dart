// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/sign_up_screen.dart';
import 'package:nuvigator/next.dart';

class SignUpRoute extends NuRoute {
  @override
  String get path => 'sign-up';

  @override
  ScreenType? get screenType => cupertinoScreenType;

  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return const SignUpScreen();
  }
}
