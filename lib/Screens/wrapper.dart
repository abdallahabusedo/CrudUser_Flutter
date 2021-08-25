import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutterapp/Screens/Home/home.dart';
import 'package:flutterapp/Screens/Welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/models/user.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if(user.uid == null ){
      return WelcomeScreen();
    }else{
      print(user.uid);
      return Home();
    }

  }
}
