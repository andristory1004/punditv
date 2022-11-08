import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

class TotalPaymentBuyPundi extends StatelessWidget {
  const TotalPaymentBuyPundi({
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
              'Total Payment',
              style: TextStyle(
                  color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 364,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0XFF232342),
                boxShadow: [
                  BoxShadow(
                      color: kwhite.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 1))
                ]),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Pundi',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/coins_popup.png',
                            width: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '500',
                            style: TextStyle(
                                color: kwhite,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rp. 30.000',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rp. 3.000',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Payment',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rp. 27.000',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
