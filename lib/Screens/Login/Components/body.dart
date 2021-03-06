import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/Screens/Home/home.dart';
import 'package:flutterapp/Screens/Login/Components/RoundedPassword.dart';
import 'package:flutterapp/Screens/Login/Components/background.dart';
import 'package:flutterapp/Screens/Login/Components/have_an_account_check.dart';
import 'package:flutterapp/Screens/Login/Components/rounded_text_field.dart';
import 'package:flutterapp/Screens/SignUP/signup.dart';
import 'package:flutterapp/Screens/wrapper.dart';
import 'package:flutterapp/Services/auth.dart';
import 'package:flutterapp/components/rounded_button.dart';
import 'package:flutterapp/constants.dart';

class LoginBackground extends StatelessWidget {

  const LoginBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              width: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedTextField(
              validateor:(val)=> val!.isEmpty ? "enter an email": null,
              onChanged: (value) {},
              hintText: "Email",
              textIcon: Icon(
                Icons.person,
                color: KPrimaryColor,
              ),
            ),
            RoundededPasswordField(
              validateor: (val)=> val!.length < 6 ? "enter an valid password": null ,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Login",
              press: () async {
              dynamic result = await _auth.signInAnon();
              if(result == null)
                {
                  print("error in sign in ");
                }else {
                print("sign in");
                print(result);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) {
                  return Wrapper();
                },
                ));
              }
              },
              color: KPrimaryColor,
              text_color: Colors.white,
            ),
            SizedBox(height: size.height * 0.03),
            HaveAnAccountCheck(
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
            )
          ],
        ),
      ),
    );
  }
}
