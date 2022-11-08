import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

class TitleRefferal extends StatelessWidget {
  const TitleRefferal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kwhiteBg,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.only(left: 24, top: 15),
      child: Text(
        'Referrals',
        style: TextStyle(
            color: kpurple, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
