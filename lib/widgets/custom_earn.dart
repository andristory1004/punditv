import 'package:flutter/material.dart';

import '../utils/constrans.dart';

class CustomEarns extends StatelessWidget {
  final String coins, images, title, description;
  final Function() ontap;
  const CustomEarns(
      {Key? key,
      required this.coins,
      required this.images,
      required this.title,
      required this.description,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: kpurple.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 2))
              ]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      coins,
                      style: TextStyle(fontSize: 12, color: kpurple),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      images,
                      width: 50,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      title,
                      style: TextStyle(
                          color: kpurple,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      description,
                      style: TextStyle(color: kpurple, fontSize: 12),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
