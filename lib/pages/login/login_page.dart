import 'package:flutter/material.dart';
import 'package:trickle/services/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authService = get<AuthFlow>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _authService.auth(),
          child: Text('Login'),
        ),
      ),
    );
  }
}
