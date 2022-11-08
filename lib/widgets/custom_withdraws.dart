import 'package:flutter/material.dart';

import '../utils/constrans.dart';

class CustomWithdraws extends StatefulWidget {
  final String money;
  final Function(String) tapHandler;
  final bool selected;
  const CustomWithdraws(
      {Key? key,
      required this.money,
      required this.tapHandler,
      required this.selected})
      : super(key: key);

  @override
  State<CustomWithdraws> createState() => _CustomWithdrawsState();
}

class _CustomWithdrawsState extends State<CustomWithdraws> {
  Color switchRupiahColor() {
    if (widget.selected) {
      return kblue;
    } else {
      return kpurple;
    }
  }

  Color switchColorContent() {
    if (widget.selected) {
      return kwhite;
    } else {
      return kgrayNav;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 115,
      height: 60,
      duration: const Duration(microseconds: 500),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
          color: switchRupiahColor(),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: kwhite.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 1))
          ]),
      child: InkWell(
        onTap: () {
          widget.tapHandler(widget.money);
        },
        child: Center(
          child: Text(
            widget.money,
            style: TextStyle(
                color: switchColorContent(),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
