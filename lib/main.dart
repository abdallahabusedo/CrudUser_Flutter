import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/Welcome/welcome_screen.dart';
import 'package:flutterapp/Screens/wrapper.dart';
import 'package:flutterapp/Services/auth.dart';
import 'package:flutterapp/constants.dart';
import 'package:flutterapp/models/user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      initialData: User(uid: null),
      catchError: (_, __) => User(uid: null),
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: ThemeData(
          primaryColor: KPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: Wrapper(),
        //home: WelcomeScreen(),
      ),
    );
  }
}
