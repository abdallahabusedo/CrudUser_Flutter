import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/Login/Login.dart';
import 'package:flutterapp/Screens/SignUP/signup.dart';
import 'package:flutterapp/Screens/Welcome/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/components/rounded_button.dart';
import 'package:flutterapp/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // this size provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to Posidoon App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              color: KPrimaryColor,
              text_color: Colors.white,
            ),
            RoundedButton(
              text: "Register",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpPage();
                    },
                  ),
                );
              },
              color: KPrimaryLightColor,
              text_color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
