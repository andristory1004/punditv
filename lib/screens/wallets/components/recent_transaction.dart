import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../utils/constrans.dart';

class RecentTransaction extends StatelessWidget {
  const RecentTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kwhiteBg,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Recent Transactions',
                    style: TextStyle(
                        color: kblack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 24),
                //   child: GestureDetector(
                //     onTap: () {
                //       showModalBottomSheet(
                //           context: context,
                //           builder: (BuildContext ctx) {
                //             return Expanded(
                //                 child: ListView.builder(
                //                     itemCount: wallets.length,
                //                     itemBuilder: (context, index) {
                //                       return ItemsWallets(
                //                           wallets: wallets[index]);
                //                     }));
                //           });
                //     },
                //     child: Text(
                //       'See All',
                //       style: TextStyle(color: kblue, fontSize: 12),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            width: 374,
            height: 125,
            decoration: BoxDecoration(
                color: kpurple, borderRadius: BorderRadius.circular(5)),
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
          ),
        ],
      ),
    );
  }
}
