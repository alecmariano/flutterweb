import 'package:flutter/material.dart';

class CustomFlexField extends StatefulWidget {
  final text;
  final value;

  CustomFlexField(this.text, this.value);

  @override
  _CustomFlexFieldState createState() => _CustomFlexFieldState(text, value);
}

class _CustomFlexFieldState extends State<CustomFlexField> {
  String text;
  String value;

  _CustomFlexFieldState(this.text, this.value);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: text,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    ));
  }
}
