import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/Screens/Login/Components/RoundedPassword.dart';
import 'package:flutterapp/Screens/Login/Login.dart';
import 'package:flutterapp/Screens/SignUP/Components/background.dart';
import 'package:flutterapp/Screens/Login/Components/have_an_account_check.dart';
import 'package:flutterapp/Screens/Login/Components/rounded_text_field.dart';
import 'package:flutterapp/Screens/SignUP/components/or_divider.dart';
import 'package:flutterapp/Screens/SignUP/components/social_icons.dart';
import 'package:flutterapp/components/rounded_button.dart';
import 'package:flutterapp/constants.dart';

class SignUpbackground extends StatelessWidget {
  const SignUpbackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SignUP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              width: size.height * 0.25,
            ),
            SizedBox(height: size.height * 0.01),
            RoundedTextField(
              onChanged: (value) {},
              hintText: "Email",
              textIcon: Icon(
                Icons.person,
                color: KPrimaryColor,
              ),
            ),
            RoundededPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SignUP",
              press: () {},
              color: KPrimaryColor,
              text_color: Colors.white,
            ),
            SizedBox(height: size.height * 0.01),
            HaveAnAccountCheck(
              login: false,
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
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcons(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcons(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
                SocialIcons(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
