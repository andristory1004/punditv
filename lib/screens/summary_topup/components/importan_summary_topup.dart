import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

class ImportantSummaryTopup extends StatelessWidget {
  const ImportantSummaryTopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      width: double.infinity,
      height: 85,
      decoration: BoxDecoration(color: kyellow),
      child: Text(
          overflow: TextOverflow.clip,
          'important..!, please transfer with the last 3 digits of the number, unique code used to verify your transaction.'),
    );
  }
}
