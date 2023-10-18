import 'package:flutter/material.dart';
import 'package:flutter_app/routes/add_local_route.dart';
import 'package:flutter_app/routes/map_route.dart';

import 'package:nuvigator/next.dart';

import 'routes/home_routes.dart';
import 'routes/login_route.dart';
import 'routes/profile_route.dart';
import 'routes/sign_up_route.dart';

class MyRouter extends NuRouter {
  @override
  String get initialRoute => 'home';

  @override
  List<NuRoute<NuRouter, Object?, Object?>> get registerRoutes => [
        HomeRoute(),
        LoginRoute(),
        ProfileRoute(),
        SignUpRoute(),
        MapRoute(),
        AddLocalRoute(),
      ];

  Widget build(BuildContext context) {
    return Nuvigator(router: MyRouter());
  }
}
