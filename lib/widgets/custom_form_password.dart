import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

class CustomFormPassword extends StatelessWidget {
  final String hintText;
  final String textValidator;
  final TextEditingController controller;
  final IconButton suffixIcon;
  final Icon prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  const CustomFormPassword(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.suffixIcon,
      required this.prefixIcon,
      required this.obscureText,
      required this.textValidator,
      required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          // validator: (value) {
          //   if (value!.isEmpty) {
          //     return textValidator;
          //   } else {
          //     return null;
          //   }
          // },

          validator: (String? arg) {
            if (arg == null || arg.isEmpty) {
              return 'The field is required..!';
            }
            // else if (arg.length > 8) {
            //   return 'Minimum field is 8..!';
            // }
            return null;
          },
          onSaved: (String? val) {
            controller.text = val!;
          },
          style: TextStyle(color: kwhite, fontSize: 16),
          controller: controller,
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
            hintStyle: TextStyle(color: kwhite),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          )),
    );
  }
}
