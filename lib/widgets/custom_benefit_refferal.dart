import 'package:flutter/material.dart';

import '../utils/constrans.dart';

class CustomBenefitRefferal extends StatelessWidget {
  final String images, title, description;
  const CustomBenefitRefferal(
      {super.key,
      required this.images,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 24),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Image.asset(
                    images,
                    width: 25,
                  ),
                ],
              ),
              SizedBox(
                width: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: kblack,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 5),
            child: Text(
              description,
              style: TextStyle(color: kblack, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
