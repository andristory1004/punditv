import 'package:flutter/material.dart';
import 'package:punditv/widgets/custom_withdraws.dart';

import '../../../utils/constrans.dart';

class CashWithdraws extends StatefulWidget {
  const CashWithdraws({super.key});

  @override
  State<CashWithdraws> createState() => _CashWithdrawsState();
}

class _CashWithdrawsState extends State<CashWithdraws> {
  var selectedmoney = '250.000';
  void _selectedMoney(money) {
    setState(() {
      selectedmoney = money;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kwhite, width: 2))),
            child: Text(
              'Cash',
              style: TextStyle(
                  color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Wrap(
              spacing: 5,
              alignment: WrapAlignment.center,
              runSpacing: 10,
              children: [
                CustomWithdraws(
                    money: 'Rp. 50.000',
                    tapHandler: _selectedMoney,
                    selected: selectedmoney == 'Rp. 50.000'),
                CustomWithdraws(
                    money: 'Rp. 100.000',
                    tapHandler: _selectedMoney,
                    selected: selectedmoney == 'Rp. 100.000'),
                CustomWithdraws(
                    money: 'Rp. 150.000',
                    tapHandler: _selectedMoney,
                    selected: selectedmoney == 'Rp. 150.000'),
                CustomWithdraws(
                    money: 'Rp. 200.000',
                    tapHandler: _selectedMoney,
                    selected: selectedmoney == 'Rp. 200.000'),
                CustomWithdraws(
                    money: 'Rp. 250.000',
                    tapHandler: _selectedMoney,
                    selected: selectedmoney == 'Rp. 250.000'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
