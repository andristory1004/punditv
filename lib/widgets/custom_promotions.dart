import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/constrans.dart';

class CustomPromotions extends StatelessWidget {
  final String images, title, texts, pundi, texts2;
  final Function() onTap;
  const CustomPromotions(
      {Key? key,
      required this.images,
      required this.title,
      required this.texts,
      required this.pundi,
      required this.texts2,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: kwhiteBg,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(title,
                    style: TextStyle(
                        color: kpurple,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    texts,
                    style: TextStyle(color: kpurple, fontSize: 12),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(pundi,
                      style: TextStyle(
                          color: kpurple,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text(texts2,
                  style: TextStyle(
                    color: kpurple,
                    fontSize: 12,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
