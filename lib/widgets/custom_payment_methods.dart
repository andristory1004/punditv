import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

class CustomPaymentMethod extends StatelessWidget {
  final String text;
  final String images;
  const CustomPaymentMethod(
      {super.key, required this.text, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      width: double.infinity,
      height: 40,
      decoration:
          BoxDecoration(color: kgray, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                color: kblack, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            images,
            width: 116,
          )
        ],
      ),
    );
  }
}
