import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/screens/buy_pundi_topup/buy_pundi.dart';
import 'package:punditv/screens/refferal/components/benerfit_refferal.dart';
import 'package:punditv/screens/refferal/components/header_refferal.dart';
import 'package:punditv/screens/refferal/components/link_refferal.dart';
import 'package:punditv/screens/refferal/components/title_refferal.dart';
import 'package:punditv/screens/refferal/components/use_full_refferal.dart';
import 'package:punditv/utils/font_styles.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_benefit_refferal.dart';

import '../../utils/constrans.dart';

class RefferalScreen extends StatelessWidget {
  final String data = 'https://punditv.com/';
  const RefferalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new, color: kgrayNav)),
        centerTitle: true,
        title: Text(
          'Pundi TV',
          style: TextStyle(
              color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            HeaderRefferal(),
            TitleRefferal(),
            LinkRefferal(data: data),
            Container(
              decoration: BoxDecoration(color: kwhiteBg),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          color: kblack.withOpacity(0.1))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter the invitation code to get coffers',
                      style: fontStyleBoldBlack14,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: 200,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Refferal Code',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide:
                                    BorderSide(color: kgrayText, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                                borderSide:
                                    BorderSide(color: kgrayText, width: 1),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'Connect',
                                style: TextStyle(
                                    color: kpurple,
                                    fontWeight: FontWeight.bold),
                              ),
                              Image.asset('assets/icons/key.png', width: 15)
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            BenefitRefferal(),
          ],
        ),
      ),
    );
  }
}
