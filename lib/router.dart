import 'package:flutter/material.dart';
import 'package:flutter_app/routes/add_local_route.dart';
import 'package:flutter_app/routes/dashboard_route.dart';
import 'package:flutter_app/routes/index_route.dart';
import 'package:flutter_app/routes/map_route.dart';

import 'package:nuvigator/next.dart';

import 'routes/home_routes.dart';
import 'routes/login_route.dart';
import 'routes/profile_route.dart';
import 'routes/sign_up_route.dart';

class MyRouter extends NuRouter {
  @override
  String get initialRoute => 'index';

  @override
  List<NuRoute<NuRouter, Object?, Object?>> get registerRoutes => [
        IndexRoute(),
        LoginRoute(),
        HomeRoute(),
        ProfileRoute(),
        SignUpRoute(),
        MapRoute(),
        AddLocalRoute(),
        DashboardRoute()
      ];

  Widget build(BuildContext context) {
    return Nuvigator(router: MyRouter());
  }
}
