import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  Color currentColor = Colors.white;
  String buttonLabel;

  CustomButton({this.buttonLabel});

  @override
  State<CustomButton> createState() {
    return CustomButtonState(this.currentColor, this.buttonLabel);
  }
}

class CustomButtonState extends State<CustomButton> {
  CustomButtonState(this.currentColor, this.buttonLabel);
  Color currentColor;
  String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: FlatButton(
        color: currentColor,
        textColor: Colors.black,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        splashColor: Colors.blueAccent,
        onPressed: () {
          this.setState(() => this.currentColor = Color(12-21-12));
        },
        child: Text(
          this.buttonLabel,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
