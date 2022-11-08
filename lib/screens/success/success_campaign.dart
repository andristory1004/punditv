import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../utils/constrans.dart';

class SuccessCampaign extends StatefulWidget {
  final String messageSuccessCampaign;
  const SuccessCampaign({super.key, required this.messageSuccessCampaign});

  @override
  State<SuccessCampaign> createState() => _SuccessCampaignState();
}

class _SuccessCampaignState extends State<SuccessCampaign> {
  final RoundedLoadingButtonController SuccessCampaignController =
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
              widget.messageSuccessCampaign,
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
