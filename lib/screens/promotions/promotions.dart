import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/screens/promotions/components/content_promotions.dart';
import 'package:punditv/screens/promotions/components/header_promotions.dart';
import 'package:punditv/utils/next_screen.dart';

import '../../utils/constrans.dart';

class PromotionScreen extends StatelessWidget {
  const PromotionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: kwhite)),
        centerTitle: true,
        title: Text(
          'Pundi TV',
          style: TextStyle(
              color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView(
          children: [HeaderPromotions(), ContentPromotion()],
        ),
      ),
    );
  }
}
