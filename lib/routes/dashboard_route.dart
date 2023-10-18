// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/dashboard_screen.dart';
import 'package:nuvigator/next.dart';

class DashboardRoute extends NuRoute {
  @override
  String get path => 'dashboard';

  @override
  ScreenType? get screenType => cupertinoScreenType;

  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return const DashboardScreen();
  }
}
