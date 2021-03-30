import 'package:flutter/material.dart';

class CustomFlexField extends StatefulWidget {
  final labelText;

  CustomFlexField(this.labelText);

  @override
  _CustomFlexFieldState createState() => _CustomFlexFieldState(labelText);
}

class _CustomFlexFieldState extends State<CustomFlexField> {
  String labelText;

  _CustomFlexFieldState(this.labelText);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: labelText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    ));
  }
}
