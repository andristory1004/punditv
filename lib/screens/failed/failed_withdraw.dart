import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../utils/navigation.dart';

class FailedWithdraws extends StatefulWidget {
  const FailedWithdraws({super.key});

  @override
  State<FailedWithdraws> createState() => _FailedWithdrawsState();
}

class _FailedWithdrawsState extends State<FailedWithdraws> {
  final RoundedLoadingButtonController failedWithdrawsController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_f09c9g7f.json',
                width: 200,
                height: 200),
            Text(
              'Sorry',
              style: TextStyle(
                  color: kwhite, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "your youtube link can't Valid",
              style: TextStyle(color: kwhite, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
              child: CustomButton(
                text: 'Ok',
                onpress: () {
                  NextScreen(context, const NavigationScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
