import 'package:flutter/material.dart';
import 'package:punditv/screens/payment_methods_withdraws/payment_method_witdraws.dart';
import 'package:punditv/screens/success/success_withdraws.dart';
import 'package:punditv/screens/withdraws/components/bin_account_withdraws.dart';
import 'package:punditv/screens/withdraws/components/button_withdraws.dart';
import 'package:punditv/screens/withdraws/components/cash_withdraws.dart';
import 'package:punditv/screens/withdraws/components/current_cash_withdraws.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Withdraws extends StatefulWidget {
  const Withdraws({super.key});

  @override
  State<Withdraws> createState() => _WithdrawsState();
}

class _WithdrawsState extends State<Withdraws> {
  final RoundedLoadingButtonController successWithdrawsController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: Text(
          'Pundi TV Withdraw',
          style: TextStyle(
              color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          CurrentCashWithdraws(),
          CashWithdraws(),
          BinAccountWithdraws(),
          ButtonWithdraws(
              successWithdrawsController: successWithdrawsController),
        ],
      ),
    );
  }
}
