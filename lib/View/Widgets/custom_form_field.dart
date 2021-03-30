import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final flex;
  final labelText;

  CustomFormField(this.flex, this.labelText);

  @override
  _CustomFormFieldState createState() => _CustomFormFieldState(flex, labelText);
}

class _CustomFormFieldState extends State<CustomFormField> {
  int flex;
  String labelText;

  _CustomFormFieldState(this.flex, this.labelText);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
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
