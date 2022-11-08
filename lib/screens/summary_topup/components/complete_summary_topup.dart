import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

class CompleteSummaryTopUp extends StatelessWidget {
  const CompleteSummaryTopUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'complete the transaction before',
              style: TextStyle(
                  color: kblack, fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/icons/clock.png',
                  width: 24,
                  height: 24,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '23.59 Today',
                  style: TextStyle(
                      color: kblack, fontSize: 15, fontWeight: FontWeight.w700),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                overflow: TextOverflow.clip,
                'After the transfer is confirmed, system will send ballance accordingto the nominal request',
                style: TextStyle(color: kblack, fontSize: 12),
              ),
            )
          ],
        ));
  }
}
