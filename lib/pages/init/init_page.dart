import 'package:flutter/material.dart';
import 'package:trickle/services/services.dart';
import 'package:trickle/widgets/common_progress_indicator.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final _router = get<AppRouter>();
  final _credentials = get<Credentials>();

  @override
  initState() {
    super.initState();
    _init();
  }

  Future _init() async {
    _moveOn();
  }

  void _moveOn() {
    _router.replace(
      _credentials.isAuthenticated ? NowPlayingRoute() : LoginRoute(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CommonProgressIndicator(),
      ),
    );
  }
}
