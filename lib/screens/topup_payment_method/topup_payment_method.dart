import 'package:flutter/material.dart';
import 'package:punditv/screens/topup_payment_method/components/bank_transfer_topup_payment_methods.dart';
import 'package:punditv/screens/topup_payment_method/components/virtual_account_paymet_methods.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/widgets/custom_payment_methods.dart';

class TopUpPaymentMethodPundi extends StatelessWidget {
  const TopUpPaymentMethodPundi({super.key});

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
          'Top Up Payment Methods',
          style: TextStyle(
              color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            BankTransferTopUpPayment(),
            VirtualAccountTopUpPaymentMethod()
          ],
        ),
      ),
    );
  }
}
