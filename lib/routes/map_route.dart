// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/pages/map_screen.dart';
import 'package:nuvigator/next.dart';

class MapRoute extends NuRoute {
  @override
  String get path => 'map';

  @override
  ScreenType? get screenType => materialScreenType;

  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return MapScreen();
  }
}
