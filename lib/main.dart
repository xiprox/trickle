import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trickle/config/theme.dart';
import 'package:trickle/services/services.dart';
import 'package:trickle/utils/hive_utils.dart';

import 'app_wrapper.dart';

void main() async {
  await HiveUtils.init();
  await Services.init();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = get<AppRouter>();

  final _credentials = get<Credentials>();

  @override
  void initState() {
    super.initState();
    _credentials.isAuthenticatedStream
        .distinct()
        .listen((auth) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return AppWrapper(MaterialApp.router(
      title: 'Trickle',
      theme: AppTheme.build(Brightness.light),
      darkTheme: AppTheme.build(Brightness.dark),
      themeMode: ThemeMode.system,
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
    ));
  }
}
