import 'package:flutter/material.dart';
import 'package:punditv/screens/buy_pundi_topup/components/button_buy_pundi.dart';
import 'package:punditv/screens/buy_pundi_topup/components/custom_topup_payment_buy_pundi.dart';
import 'package:punditv/screens/buy_pundi_topup/components/payment_method_buy_pundi.dart';
import 'package:punditv/screens/buy_pundi_topup/components/recomment_top_up.dart';
import 'package:punditv/screens/buy_pundi_topup/components/total_payment_buy_pundi.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/screens/topup_payment_method/topup_payment_method.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:punditv/widgets/custom_topup_pundi.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class BuyPundi extends StatefulWidget {
  const BuyPundi({super.key});

  @override
  State<BuyPundi> createState() => _BuyPundiState();
}

class _BuyPundiState extends State<BuyPundi> {
  final RoundedLoadingButtonController buyPundiController =
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
        title: Text(
          'Buy Pundi / Top Up',
          style: TextStyle(
              color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            RecommentTopUp(),
            CustomTopUpBuyPundi(),
            TotalPaymentBuyPundi(),
            PaymentMethodsBuyPundi(),
            ButtonBuyPundi(buyPundiController: buyPundiController)
          ],
        ),
      ),
    );
  }
}
