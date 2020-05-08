import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput({this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 40, top: 5, right: 40, bottom: 5),
        child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: this.label,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          onChanged: (value) => print(value),
        ));
  }
}
