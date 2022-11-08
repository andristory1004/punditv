import 'package:flutter/material.dart';

import '../utils/constrans.dart';

class CustomStore extends StatelessWidget {
  final String images, title, description;
  final Function() ontap;
  const CustomStore(
      {Key? key,
      required this.images,
      required this.title,
      required this.description,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
          width: 364,
          height: 150,
          decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: kblack.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 2))
              ]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset(
                  images,
                  width: 50,
                  height: 50,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    color: kpurple, fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                textAlign: TextAlign.center,
                description,
                style: TextStyle(color: kpurple),
              )
            ],
          ),
        ));
  }
}
