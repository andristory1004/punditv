import 'package:flutter/material.dart';
import 'package:punditv/screens/summary_topup/summary_topup.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ButtonBuyPundi extends StatelessWidget {
  const ButtonBuyPundi({
    Key? key,
    required this.buyPundiController,
  }) : super(key: key);

  final RoundedLoadingButtonController buyPundiController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 54, horizontal: 24),
      child: CustomButton(
        text: 'Pay Now',
        onpress: () => NextScreen(context, const SummaryTopUps()),
      ),
    );
  }
}
