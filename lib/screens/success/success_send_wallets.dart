import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../utils/constrans.dart';
import '../../utils/next_screen.dart';

class SuccessSendWallets extends StatefulWidget {
  const SuccessSendWallets({super.key});

  @override
  State<SuccessSendWallets> createState() => _SuccessSendWalletsState();
}

class _SuccessSendWalletsState extends State<SuccessSendWallets> {
  final RoundedLoadingButtonController successSendWalletController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_xwmj0hsk.json',
                width: 200,
                height: 200),
            Text(
              'Success',
              style: TextStyle(
                  color: kwhite, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your credit pundi has been successfully sent..!',
              style: TextStyle(
                  color: kwhite, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: CustomButton(
                text: 'Ok',
                onpress: () {
                  NextScreen(context, const NavigationScreen());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
