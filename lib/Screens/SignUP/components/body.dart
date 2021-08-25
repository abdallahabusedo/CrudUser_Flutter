import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterapp/Screens/Login/Components/RoundedPassword.dart';
import 'package:flutterapp/Screens/Login/Login.dart';
import 'package:flutterapp/Screens/SignUP/Components/background.dart';
import 'package:flutterapp/Screens/Login/Components/have_an_account_check.dart';
import 'package:flutterapp/Screens/Login/Components/rounded_text_field.dart';
import 'package:flutterapp/Screens/SignUP/components/or_divider.dart';
import 'package:flutterapp/Screens/SignUP/components/social_icons.dart';
import 'package:flutterapp/Screens/wrapper.dart';
import 'package:flutterapp/Services/auth.dart';
import 'package:flutterapp/components/rounded_button.dart';
import 'package:flutterapp/constants.dart';

class SignUpBackground extends StatefulWidget {
  const SignUpBackground({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpBackgroundState createState() => _SignUpBackgroundState();
}

class _SignUpBackgroundState extends State<SignUpBackground> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String error = "";
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
            SizedBox(height: 12.0,),
            Text(error),
            SizedBox(height: size.height * 0.01),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RoundedTextField(
                    validateor: (val)=> val!.isEmpty ? "enter an email": null,
                    onChanged: (value) {
                      setState(()=>email=value);
                    },
                    hintText: "Email",
                    textIcon: Icon(
                      Icons.person,
                      color: KPrimaryColor,
                    ),
                  ),
                 RoundededPasswordField(
                   validateor: (val)=> val!.length < 6 ? "enter an valid password": null ,
                    onChanged: (value) {
                      setState(()=>password=value);
                    },
                  ),
                  RoundedButton(
                    text: "SignUP",
                    press: () async {
                        final  form = _formKey.currentState;
                        if(form!.validate()){
                          dynamic res = await _auth.registerWithEmailAndPassword(email, password);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Wrapper();
                                },
                              ));
                          if(res == null){
                            setState(() {
                              error = "enter valid data";
                            });
                          }
                        }
                      },
                    color: KPrimaryColor,
                    text_color: Colors.white,
                  ),

                ],
            ),
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
