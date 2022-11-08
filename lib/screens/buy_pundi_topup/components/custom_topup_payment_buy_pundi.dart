import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

class CustomTopUpBuyPundi extends StatelessWidget {
  const CustomTopUpBuyPundi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 5.0),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kwhite, width: 1))),
            child: Text(
              'Custom Top Up',
              style: TextStyle(
                  color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            width: 364,
            height: 59,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0XFF232342),
                boxShadow: [
                  BoxShadow(
                      color: kwhite.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 1))
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/coins_popup.png',
                    width: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '0',
                    style: TextStyle(color: kwhite, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
