import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/screens/earning_page/components/banner_earn_coin.dart';
import 'package:punditv/screens/earning_page/components/earn_progress.dart';
import 'package:punditv/screens/earning_page/components/item_Earn_coin.dart';
import 'package:punditv/screens/home/profile.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({super.key});

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  @override
  Widget build(BuildContext context) {
    Widget bannerEarning() {
      return Container(
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 24.0),
          padding: EdgeInsets.all(8.0),
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
              color: kpurple, borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Credits Pundi Ballance',
                style: TextStyle(
                    color: kwhite, fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Lottie.network(
                          'https://assets3.lottiefiles.com/temp/lf20_pO3t5Q.json',
                          width: 70),
                      Text(
                        '200.000',
                        style: TextStyle(
                            color: kwhite,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/icons/icon_pundi.png',
                    width: 54,
                  )
                ],
              ),
              Text(
                overflow: TextOverflow.fade,
                'Get more credit pundi on Pundi TV coffers and exchange your credit pundi into wallet balance, then withdraw your wallet balance via Nusapay',
                style: TextStyle(color: kwhite, fontSize: 12),
              )
            ],
          ));
    }

    Widget earningProgress(
        double min, double max, String titleName, String name) {
      RangeValues values = RangeValues(min, max);
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 44.0, top: 5.0),
              child: Text(titleName,
                  style: TextStyle(
                      color: kblack,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                  thumbColor: kpurple,
                  trackHeight: 3,
                  minThumbSeparation: 100,
                  valueIndicatorColor: kpurple,
                  overlappingShapeStrokeColor: kblue,
                  overlayColor: kblue),
              child: RangeSlider(
                  activeColor: kpurple,
                  inactiveColor: kblue,
                  labels: RangeLabels(
                      values.start.toString(), values.end.toString()),
                  min: min,
                  max: max,
                  divisions: 60,
                  values: values,
                  onChanged: (val) {
                    setState(() {
                      values = val;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(min.toString() + name,
                    style: TextStyle(color: kblack, fontSize: 12)),
                Text(max.toString() + name,
                    style: TextStyle(color: kblack, fontSize: 12)),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kwhiteBg,
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: Image.asset('assets/images/punditv_logo.png'),
        actions: [
          IconButton(
              onPressed: () => NextScreen(context, const ProfileScreen()),
              icon: CircleAvatar(
                backgroundColor: kpurpleSecond,
                radius: 25,
                child: Icon(Icons.person),
              ))
        ],
      ),
      body: ListView(
        // children: [HeaderEarnCoins(), EarnCoinProgress(), ItemEarnCoins()],
        children: [
          bannerEarning(),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: kwhiteBg,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Earning Progress',
                style: TextStyle(
                    color: kpurple, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              earningProgress(0, 40, "View Duration", " Minute"),
              earningProgress(0, 20, "Amount Subscribe", " subscribe")
            ]),
          ),
          ItemEarnCoins()
        ],
      ),
    );
  }
}
