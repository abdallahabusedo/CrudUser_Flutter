import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/Login/Components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(),
    );
  }
}
