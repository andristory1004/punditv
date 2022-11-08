import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/screens/campaign/campaign.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class FailedCampaign extends StatefulWidget {
  final String command;
  const FailedCampaign({super.key, required this.command});

  @override
  State<FailedCampaign> createState() => _FailedCampaignState();
}

class _FailedCampaignState extends State<FailedCampaign> {
  final RoundedLoadingButtonController fcController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kpurpleSecond, Colors.black])),
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
              maxLines: 3,
              widget.command,
              textAlign: TextAlign.center,
              style: TextStyle(color: kwhite, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
              child: CustomButton(
                text: 'Ok',
                onpress: () {
                  NextScreen(context, const CampaignScreen());
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
