import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

class CurrentCashWithdraws extends StatelessWidget {
  const CurrentCashWithdraws({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      child: Container(
        width: 364,
        height: 158,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: kwhite.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 2))
        ], color: Color(0XFF232342), borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Currenct Cash',
                    style: TextStyle(color: kwhite, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: kgray,
                      ),
                      Text(
                        'Histori',
                        style: TextStyle(fontSize: 12, color: kwhite),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                'Rp. 250.000',
                style: TextStyle(
                    color: kwhite, fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                "withdrawals are limited to 2 times in 24 hours, \nThe balance will be deleted if you don't use punditv for more than 30 days",
                style: TextStyle(color: kwhite, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
