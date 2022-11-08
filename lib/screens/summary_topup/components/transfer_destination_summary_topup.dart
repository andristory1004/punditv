import 'package:flutter/material.dart';

import '../../../utils/constrans.dart';

class TransferDestinationSummaryTopUp extends StatelessWidget {
  const TransferDestinationSummaryTopUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 162,
      margin: EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: kwhiteBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kblack, width: 1))),
            child: Text(
              'Transfer destination',
              style: TextStyle(
                  color: kblack, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
            'assets/images/bca.png',
            width: 66,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Number bank',
                    style: TextStyle(color: kblack, fontSize: 12),
                  ),
                  Text(
                    '8831113111',
                    style: TextStyle(
                        color: kblack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 51,
                  height: 22,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblack, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(child: Text('Copy')),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
