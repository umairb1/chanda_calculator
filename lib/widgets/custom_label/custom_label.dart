import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  Widget field;
  String labelText;
  CustomLabel(this.labelText, this.field);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30, bottom: 5),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.labelText,
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.black54, fontSize: 16.0),
            ),
          ),
          this.field
        ],
      ),
    );
  }
}
