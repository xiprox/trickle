// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages/flow_builder/flow_builder_page.dart' as _i6;
import '../pages/flows/flows_page.dart' as _i7;
import '../pages/init/init_page.dart' as _i3;
import '../pages/login/login_page.dart' as _i4;
import '../pages/now_playing/now_playing_page.dart' as _i5;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    InitRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.InitPage());
    },
    LoginRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LoginPage());
    },
    NowPlayingRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.NowPlayingPage());
    },
    FlowBuilderRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.FlowBuilderPage());
    },
    FlowsRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FlowsPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(InitRoute.name, path: '/'),
        _i1.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i1.RouteConfig(NowPlayingRoute.name, path: '/now-playing-page'),
        _i1.RouteConfig(FlowBuilderRoute.name, path: '/flow-builder-page'),
        _i1.RouteConfig(FlowsRoute.name, path: '/flows-page')
      ];
}

class InitRoute extends _i1.PageRouteInfo<void> {
  const InitRoute() : super(name, path: '/');

  static const String name = 'InitRoute';
}

class LoginRoute extends _i1.PageRouteInfo<void> {
  const LoginRoute() : super(name, path: '/login-page');

  static const String name = 'LoginRoute';
}

class NowPlayingRoute extends _i1.PageRouteInfo<void> {
  const NowPlayingRoute() : super(name, path: '/now-playing-page');

  static const String name = 'NowPlayingRoute';
}

class FlowBuilderRoute extends _i1.PageRouteInfo<void> {
  const FlowBuilderRoute() : super(name, path: '/flow-builder-page');

  static const String name = 'FlowBuilderRoute';
}

class FlowsRoute extends _i1.PageRouteInfo<void> {
  const FlowsRoute() : super(name, path: '/flows-page');

  static const String name = 'FlowsRoute';
}
