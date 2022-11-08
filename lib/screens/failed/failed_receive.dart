import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../utils/constrans.dart';

class FailedReceiveSend extends StatefulWidget {
  const FailedReceiveSend({super.key});

  @override
  State<FailedReceiveSend> createState() => _FailedReceiveSendState();
}

class _FailedReceiveSendState extends State<FailedReceiveSend> {
  final RoundedLoadingButtonController failedReceiveSendController =
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
              //
            ),
          ],
        ),
      ),
    );
  }
}
