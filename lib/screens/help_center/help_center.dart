import 'package:flutter/material.dart';
import 'package:punditv/screens/home/profile.dart';
import 'package:punditv/utils/next_screen.dart';

import '../../utils/constrans.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kpurple,
        appBar: AppBar(
          backgroundColor: kpurple,
          elevation: 0,
          leading: IconButton(
              onPressed: () => NextScreen(context, const ProfileScreen()),
              icon: Icon(Icons.arrow_back_ios_new)),
          centerTitle: true,
          title: Text(
            'Help Center',
            style: TextStyle(
                color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        bottomSheet: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
                color: kpurple, border: Border.all(color: kpurple)),
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.center,
              'Policy Pundi TV',
              style: TextStyle(color: kgrayText),
            )),
        body: Container(
            child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kategories',
                    style: TextStyle(
                        color: kwhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FAQ',
                    style: TextStyle(
                        color: kwhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
