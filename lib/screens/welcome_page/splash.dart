import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:punditv/screens/home/home.dart';
import 'package:punditv/utils/navigation.dart';

import '../../provider/sign_in_provider.dart';
import '../../utils/constrans.dart';
import '../../utils/next_screen.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final sp = context.read<SignInProvider>();
    Timer(const Duration(seconds: 3), () {
      sp.isSignedIn == false
          ? NextScreen(context, const Onboardings())
          : NextScreen(context, const NavigationScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kpurple, kblack])),
        child: Center(
          child: Image.asset(
            'assets/images/logo_pundi.png',
            width: 378,
            height: 352,
          ),
        ),
      ),
    );
  }
}
