import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

class HeaderCampaign extends StatelessWidget {
  const HeaderCampaign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kpurple),
      child: CarouselSlider(
          items: [
            Image.asset(
              'assets/images/punditv_logo.png',
              width: 100,
              height: 75,
            ),
          ],
          options: CarouselOptions(
              autoPlay: true, aspectRatio: 2, enlargeCenterPage: true)),
    );
  }
}
