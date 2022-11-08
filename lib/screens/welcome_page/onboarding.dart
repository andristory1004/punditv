import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:punditv/screens/authenticate/login.dart';
import 'package:punditv/services/auth_user.dart';
import 'package:punditv/utils/navigation.dart';

import 'package:punditv/utils/next_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constrans.dart';

class Onboardings extends StatefulWidget {
  const Onboardings({Key? key}) : super(key: key);

  @override
  State<Onboardings> createState() => _OnboardingsState();
}

class _OnboardingsState extends State<Onboardings> {
  late String? accessToken = "";
  // void getPref() async {
  //   SharedPreferences _pref = await SharedPreferences.getInstance();
  //   accessToken = _pref.getString('access_token')!;
  // if (token == null) {
  //   accessToken = "";
  // } else {
  //   accessToken = token;
  // }
  // }

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var islogin = pref.getBool("is_login");
    if (islogin != null && islogin == true) {
      setState(() {
        var islogin = pref.getBool("is_login");
        accessToken = pref.getString("access_token")!;
      });
    }
    // } else {
    //   Navigator.of(context, rootNavigator: true).pop();
    //   Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => const LoginScreen(),
    //     ),
    //     (route) => false,
    //   );
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    print("accessToken :" + accessToken.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: kpurple,
        scrollPhysics: BouncingScrollPhysics(),
        pages: [
          PageViewModel(
              titleWidget: Text(
                  textAlign: TextAlign.center,
                  'Watch videos \nBecome more fun and \nGet money',
                  style: const TextStyle(
                      color: kwhite,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              body: 'Come join together \nPundi TV',
              decoration: PageDecoration(
                  bodyTextStyle: TextStyle(color: kwhite, fontSize: 16)),
              image: Container(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/Onboarding.png',
                  width: 260,
                  height: 260,
                ),
              )),
          PageViewModel(
              titleWidget: Text(
                textAlign: TextAlign.center,
                "Fast and Hassle free",
                style: const TextStyle(
                    color: kwhite, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              body:
                  'Invite your friends we will pay 10% invite your friends and for each qualified friend we will pay you 10% of their cashout amount. Invite your friends as soon as possible and earn as much as you can. your friend will also receive a ${'0.02'} reward',
              decoration: PageDecoration(
                  titleTextStyle: TextStyle(color: kwhite),
                  bodyTextStyle: TextStyle(
                    color: kwhite,
                    fontSize: 12,
                  )),
              image: Image.asset(
                'assets/images/Onboarding_2.png',
                width: 260,
                height: 260,
              )),
          PageViewModel(
              titleWidget: Text(
                textAlign: TextAlign.center,
                "Earn commission",
                style: const TextStyle(
                    color: kgray, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              body:
                  'When else can you watch videos but earn  \nMoney through your refferals',
              image: Image.asset(
                'assets/images/Onboarding_3.png',
                width: 260,
                height: 260,
              ),
              decoration: PageDecoration(
                  bodyTextStyle: TextStyle(color: kgray, fontSize: 16))),
        ],
        next: Icon(
          Icons.arrow_forward_ios,
          color: kpurple,
        ),
        onDone: () {
          if (accessToken == "") {
            NextScreen(context, const LoginScreen());
          } else {
            NextScreen(context, NavigationScreen());
          }
        },
        onSkip: () => Navigator.pop(context),
        skip: Text(
          'Skip',
          style: const TextStyle(color: kgray, fontSize: 14),
        ),
        done: Row(
          children: [
            Container(
              child: Text(
                'Get Started',
                style: const TextStyle(color: kgray, fontSize: 14),
              ),
            ),
          ],
        ),
        dotsDecorator: DotsDecorator(
            size: Size.square(10),
            activeSize: Size(
              30,
              5,
            ),
            color: kwhite,
            activeColor: kblue,
            spacing: EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
}
