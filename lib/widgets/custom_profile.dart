import 'package:flutter/material.dart';

import '../utils/constrans.dart';

class CustomProfile extends StatelessWidget {
  final String images, texts;
  final Icon icons;
  final Function() onpress;
  const CustomProfile(
      {Key? key,
      required this.images,
      required this.texts,
      required this.onpress,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      decoration: BoxDecoration(
          color: kpurpleSecond,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: kwhite.withOpacity(0.1),
                offset: Offset(0, 2),
                blurRadius: 10)
          ]),
      child: InkWell(
        onTap: onpress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Image.asset(
                    images,
                    color: kgrayNav,
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  texts,
                  style: TextStyle(color: kwhite, fontSize: 15),
                ),
              ],
            ),
            IconButton(
              onPressed: onpress,
              icon: icons,
              color: kwhite,
            )
          ],
        ),
      ),
    );
  }
}
