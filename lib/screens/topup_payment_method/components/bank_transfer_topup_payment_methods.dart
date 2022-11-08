import 'package:flutter/material.dart';
import 'package:punditv/widgets/custom_payment_methods.dart';

import '../../../utils/constrans.dart';

class BankTransferTopUpPayment extends StatelessWidget {
  const BankTransferTopUpPayment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 160,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 17.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kpurpleSecond,
            boxShadow: [
              BoxShadow(
                  color: kwhite.withOpacity(0.1),
                  offset: Offset(0, 4),
                  blurRadius: 10)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 2, color: kwhite))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bank Transfer',
                    style: TextStyle(
                        color: kwhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
              child: CustomPaymentMethod(
                  text: 'BCA', images: 'assets/images/bca.png'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
              child: CustomPaymentMethod(
                  text: 'PERMATA', images: 'assets/images/permata.png'),
            ),
          ],
        ));
  }
}
