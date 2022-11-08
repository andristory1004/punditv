import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

class TransfersAmountSummaryTopUp extends StatelessWidget {
  const TransfersAmountSummaryTopUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 80.0,
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 24.0),
        decoration: BoxDecoration(
          color: kpurple,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Transfer amount',
                  style: TextStyle(
                      color: kwhite, fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Rp  27.124',
                  style: TextStyle(
                      color: korange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            InkWell(
              child: Container(
                width: 51,
                height: 22,
                decoration: BoxDecoration(
                    border: Border.all(color: kwhite, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                    child: Text(
                  'Copy',
                  style: TextStyle(color: kwhite),
                )),
              ),
            )
          ],
        ));
  }
}
