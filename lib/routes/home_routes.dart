import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:nuvigator/next.dart';

import '../pages/home_screen.dart';

class HomeArgs {
  HomeArgs({required this.usuario});

  final User usuario;

  static HomeArgs fromJson(Map<String, dynamic> json) {
    return HomeArgs(usuario: json['user']);
  }
}

class HomeRoute extends NuRoute<NuRouter, HomeArgs, User> {
  @override
  String get path => 'home';

  @override
  ScreenType? get screenType => materialScreenType;
  @override
  ParamsParser<HomeArgs> get paramsParser => HomeArgs.fromJson;

  @override
  Widget build(BuildContext context, NuRouteSettings<HomeArgs?> settings) {
    return HomeScreen(
      usuario: settings.args!.usuario,
    );
  }
}
