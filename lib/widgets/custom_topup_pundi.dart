import 'package:flutter/material.dart';

import '../utils/constrans.dart';

class CustomTopupPundi extends StatefulWidget {
  final String images, coins, rupiah;
  final Function(String) onTaps;
  final bool isSelected;
  const CustomTopupPundi(
      {super.key,
      required this.images,
      required this.coins,
      required this.rupiah,
      required this.onTaps,
      required this.isSelected});

  @override
  State<CustomTopupPundi> createState() => _CustomTopupPundiState();
}

class _CustomTopupPundiState extends State<CustomTopupPundi> {
  Color switchTimeColor() {
    if (widget.isSelected) {
      return Color(0XFF232342);
    } else {
      return Color(0XFF232342);
    }
  }

  Color switchTimeContentColor() {
    if (widget.isSelected) {
      return kgray;
    } else {
      return kwhite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 100,
      height: 60,
      decoration: BoxDecoration(
          color: switchTimeColor(),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: kwhite.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 2))
          ]),
      duration: const Duration(microseconds: 500),
      curve: Curves.easeIn,
      child: InkWell(
        onTap: () {
          widget.onTaps(
            widget.coins,
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.images,
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.coins,
                    style: TextStyle(
                        color: switchTimeContentColor(),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Text(
              widget.rupiah,
              style: TextStyle(color: korange, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
