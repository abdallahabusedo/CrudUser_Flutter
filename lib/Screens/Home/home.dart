import "package:flutter/material.dart";
import 'package:flutterapp/Screens/Welcome/welcome_screen.dart';
import 'package:flutterapp/Services/auth.dart';
import 'package:flutterapp/components/rounded_button.dart';
import 'package:flutterapp/constants.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading: false,
          title: Text("Home Page"),
          backgroundColor:  KPrimaryColor,
          elevation: 0.0,
          actions: <Widget>[
            TextButton(
                onPressed: () async {
                  try{
                    await _auth.signOuts();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return WelcomeScreen();
                          },
                        ));
                  } catch(e){
                    print("Ads");
                  }

                },
                child: Icon(
                  Icons.logout,
                  color: Colors.white,),
            ),
          ],
        )


    );
  }
}
