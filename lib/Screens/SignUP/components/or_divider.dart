import 'package:flutter/material.dart';

import '../../../constants.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: KPrimaryColor,
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "OR",
              style: TextStyle(
                color: KPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: KPrimaryColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
