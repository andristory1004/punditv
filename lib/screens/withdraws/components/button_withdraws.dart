import 'package:flutter/material.dart';
import 'package:punditv/screens/success/success_withdraws.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../utils/next_screen.dart';
import '../../../widgets/custom_button.dart';

class ButtonWithdraws extends StatelessWidget {
  const ButtonWithdraws({
    Key? key,
    required this.successWithdrawsController,
  }) : super(key: key);

  final RoundedLoadingButtonController successWithdrawsController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 54),
      child: CustomButton(
        text: 'Withdraw',
        onpress: () => NextScreen(context, const SuccessWithdraw()),
      ),
    );
  }
}
