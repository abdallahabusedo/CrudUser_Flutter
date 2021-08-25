import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterapp/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, text_color;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.text_color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          onPressed: () {
            press();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Text(text,style: TextStyle(fontSize: 30,),),
          ),
          style: TextButton.styleFrom(
            backgroundColor: color,
            primary: text_color,
            onSurface: Colors.grey,
          ),

        ),
      ),

    );
  }
}
