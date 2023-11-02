import 'package:flutter/material.dart';
import 'package:flutter_app/pages/index.dart';
import 'package:nuvigator/next.dart';

class IndexRoute extends NuRoute {
  @override
  String get path => 'index';

  @override
  ScreenType? get screenType => materialScreenType;

  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return const IndexScreen();
  }
}
