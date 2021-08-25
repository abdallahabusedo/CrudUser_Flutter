import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/Login/Components/text_field_container.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final Icon textIcon;
  final Function validateor;
  final ValueChanged<String> onChanged;
  const RoundedTextField({
    Key? key,
    required this.hintText,
    required this.textIcon,
    required this.onChanged,
    required this.validateor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (val)=> validateor(val) ,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: textIcon,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
