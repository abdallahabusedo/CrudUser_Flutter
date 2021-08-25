import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/Login/Components/text_field_container.dart';

import '../../../constants.dart';

class RoundededPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Function validateor;
  const RoundededPasswordField({
    Key? key,
    required this.onChanged, required this.validateor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: (val)=> validateor(val),
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: KPrimaryColor,
            ),
            hintText: "Password",
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.visibility,
              color: KPrimaryColor,
            )),
      ),
    );
  }
}
