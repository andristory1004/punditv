import 'package:flutter/material.dart';
import 'package:punditv/utils/font_styles.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../utils/constrans.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final Function() onpress;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: kblue, borderRadius: BorderRadius.circular(32)),
          child: Center(
              child: Text(
            text,
            style: fontStyleWhitefont14,
          ))),
    );
    // return RoundedLoadingButton(
    //   width: 374,
    //   resetDuration: Duration(seconds: 3),
    //   color: kblue,
    //   elevation: 0,
    //   duration: Duration(seconds: 2),
    //   successColor: Colors.green,
    //   controller: controller,
    //   onPressed: onpress,
    //   child: Text(text,
    //       style: TextStyle(
    //           color: kwhite, fontSize: 15, fontWeight: FontWeight.bold)),
    // );
  }
}
