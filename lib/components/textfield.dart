// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tele_med/constants.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? fieldController;
  String? labelledText;
  bool obscureTextC;
  String? title;
  CustomTextField(
      {super.key,
      this.fieldController,
      this.labelledText,
      this.obscureTextC = false,
      this.title});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(15.0),
        child: TextFormField(
          controller: widget.fieldController,
          obscureText: widget.obscureTextC,
          decoration: InputDecoration(
            labelText: widget.labelledText,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.black87),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: kPrimaryColor),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "${widget.labelledText} can't be empty";
            }
            return null;
          },
          onChanged: (value) {
            widget.title = value;
            setState(() {});
          },
        ),
      ),
    );
  }
}