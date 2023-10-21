// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/models/address.dart';
import 'package:flutter_app/pages/dashboard_screen.dart';
import 'package:nuvigator/next.dart';

class DashboardDetailsArgs {
  DashboardDetailsArgs({required this.address});

  final List<Address> address;
  static DashboardDetailsArgs fromJson(Map<String, dynamic> json) {
    return DashboardDetailsArgs(address: json['usuarios']);
  }
}

class DashboardRoute extends NuRoute {
  @override
  String get path => 'dashboard';

  @override
  ScreenType? get screenType => cupertinoScreenType;

  @override
  ParamsParser<DashboardDetailsArgs> get paramsParser =>
      DashboardDetailsArgs.fromJson;

  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return const DashboardScreen();
  }
}
