import 'package:flutter/material.dart';

import '../utils/constrans.dart';

class CustomBuyCampaign extends StatefulWidget {
  final String number, text;
  final Function(String) tapHandler;
  final bool selected;
  const CustomBuyCampaign({
    Key? key,
    required this.number,
    required this.tapHandler,
    required this.selected,
    required this.text,
  }) : super(key: key);

  @override
  State<CustomBuyCampaign> createState() => _CustomBuyCampaignState();
}

class _CustomBuyCampaignState extends State<CustomBuyCampaign> {
  Color switchCampaignColor() {
    if (widget.selected) {
      return kblue;
    } else {
      return kpurple;
    }
  }

  Color switchSelectedCampaign() {
    if (widget.selected) {
      return kwhite;
    } else {
      return kgrayNav;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: switchCampaignColor(),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: kwhite.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 2))
          ]),
      curve: Curves.easeIn,
      duration: Duration(microseconds: 500),
      width: 115,
      height: 59,
      child: GestureDetector(
        onTap: () {
          widget.tapHandler(widget.number);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: [
              Text(
                widget.number,
                style: TextStyle(
                    color: switchSelectedCampaign(),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                widget.text,
                style: TextStyle(
                    color: switchSelectedCampaign(),
                    fontSize: 10,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ),
    );
  }
}
