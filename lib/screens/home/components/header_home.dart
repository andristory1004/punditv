import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:punditv/screens/buy_pundi_topup/buy_pundi.dart';
import 'package:punditv/screens/coming_soon/coming_soon.dart';
import 'package:punditv/screens/withdraws/withdraws.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';

class HeaderHome extends StatelessWidget {
  final String saldoPoint;
  final String saldoPundi;
  final String saldoNusapay;
  const HeaderHome(
      {Key? key,
      required this.size,
      required this.saldoPoint,
      required this.saldoPundi,
      required this.saldoNusapay})
      : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: kpurple,
            ),
            height: size.height * 0.2 - 27,
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: kpurple.withOpacity(0.1),
                        offset: Offset(0, 4),
                        blurRadius: 4)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => _showComingSoonHome(context),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 5.0),
                      width: 100,
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/coin_yen.png',
                                width: 16,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                saldoPoint,
                                style: TextStyle(color: kblack, fontSize: 12),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Points Credit',
                              style: TextStyle(color: kblack, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => NextScreen(context, const Withdraws()),
                    child: Container(
                      width: 110,
                      height: 60,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(width: 1, color: kblack),
                              left: BorderSide(width: 1, color: kblack))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            saldoPundi,
                            style: TextStyle(color: kblack, fontSize: 12),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Pundi Credit',
                            style: TextStyle(color: kblack, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => NextScreen(context, const BuyPundi()),
                    child: Container(
                      width: 110,
                      height: 60,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/monotone_money.png',
                                width: 16,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                saldoNusapay,
                                style: TextStyle(
                                    color: kblack,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Image.asset(
                              'assets/images/logo_nusapay.png',
                              width: 71,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _showComingSoonHome(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            elevation: 0,
            child: ComingSoon(),
          );
        });
  }
}
