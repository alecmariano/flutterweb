import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final flex;
  final labelText;
  final value;
  final controller;

  CustomFormField(this.flex, this.labelText, this.value, this.controller);

  @override
  _CustomFormFieldState createState() =>
      _CustomFormFieldState(flex, labelText, value, controller);
}

class _CustomFormFieldState extends State<CustomFormField> {
  int flex;
  String labelText;
  String value;
  TextEditingController controller;

  _CustomFormFieldState(this.flex, this.labelText, this.value, this.controller);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: controller,
            initialValue: value,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: labelText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),
        ));
  }
}
