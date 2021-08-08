import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/Login/Components/text_field_container.dart';

class RoundedTextField extends StatelessWidget {
  final String hintText;
  final Icon textIcon;
  final ValueChanged<String> onChanged;
  const RoundedTextField({
    Key? key,
    required this.hintText,
    required this.textIcon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
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
