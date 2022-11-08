import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

class CustomFormText extends StatelessWidget {
  final String? hintText;
  final Icon prefixIcons;
  final TextEditingController controllers;
  final String textValidator;
  final TextInputType? keyboardType;
  const CustomFormText({
    super.key,
    required this.hintText,
    required this.prefixIcons,
    required this.controllers,
    required this.textValidator,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        style: TextStyle(color: kwhite),
        controller: controllers,
        keyboardType: keyboardType,
        validator: (String? value) {
          if (value!.isEmpty) {
            return "The field is required..!";
          } else {
            return null;
          }
        },
        // validator: (email) => email != null && !EmailValidator.validate(email)
        //     ? 'Masukkan email yang valid'
        //     : null,
        onSaved: (String? val) {
          controllers.text = val!;
        },
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(
                18,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: kgrayNav)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kblue),
              borderRadius: BorderRadius.circular(
                18,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(
                  18,
                )),
            hintText: hintText,
            hintStyle: TextStyle(
              color: kwhite,
            ),
            prefixIcon: prefixIcons,
            prefixIconColor: kgrayNav),
      ),
    );
  }
}
