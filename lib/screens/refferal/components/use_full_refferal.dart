import 'package:flutter/material.dart';
import 'package:punditv/screens/buy_pundi_topup/buy_pundi.dart';
import 'package:punditv/utils/next_screen.dart';

import '../../../utils/constrans.dart';

class UseFullRefferal extends StatelessWidget {
  const UseFullRefferal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 24),
      width: double.infinity,
      height: 284,
      decoration: BoxDecoration(
        color: kwhiteBg,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
            color: kwhite,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  color: kblack.withOpacity(0.1))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              width: double.infinity,
              height: 54,
              decoration: BoxDecoration(
                  color: kwhiteBg,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        color: kblack.withOpacity(0.1))
                  ]),
              child: Text(
                'Usefull Links',
                style: TextStyle(
                    color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Learn to Earn Pundi',
                            style: TextStyle(color: kblue, fontSize: 15),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.arrow_right_alt_sharp,
                            color: kblue,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: 200,
                    child: InkWell(
                      onTap: () =>
                          NextScreenReplacement(context, const BuyPundi()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Buy Pundi',
                            style: TextStyle(color: kblue, fontSize: 15),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.arrow_right_alt_sharp,
                            color: kblue,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
