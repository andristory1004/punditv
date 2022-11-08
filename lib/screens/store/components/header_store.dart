import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/constrans.dart';

class HeaderStore extends StatelessWidget {
  const HeaderStore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kpurple),
      width: double.infinity,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: CarouselSlider(
            items: [
              Image.asset('assets/images/punditv_logo.png'),
            ],
            options: CarouselOptions(
                autoPlay: true, aspectRatio: 2, enlargeCenterPage: true)),
      ),
    );
  }
}
