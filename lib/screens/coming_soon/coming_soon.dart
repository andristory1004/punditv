import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../utils/constrans.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  final RoundedLoadingButtonController comingController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374,
      height: 400,
      decoration:
          BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
              'https://assets10.lottiefiles.com/packages/lf20_ypjdfhjl.json',
              width: 300,
              height: 300),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: CustomButton(
              text: 'Ok',
              onpress: () => NextScreen(context, const NavigationScreen()),
            ),
          )
        ],
      ),
    );
  }
}
