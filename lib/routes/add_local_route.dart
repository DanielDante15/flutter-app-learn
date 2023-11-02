import 'package:flutter/material.dart';
import 'package:flutter_app/pages/add_local_screen.dart';
import 'package:nuvigator/next.dart';

class AddLocalRoute extends NuRoute {
  @override
  String get path => 'add-local';

  @override
  ScreenType? get screenType => materialScreenType;

  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return AddLocalScreen();
  }
}
