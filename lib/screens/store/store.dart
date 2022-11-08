import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:punditv/provider/sign_in_provider.dart';
import 'package:punditv/screens/home/profile.dart';
import 'package:punditv/screens/store/components/header_store.dart';
import 'package:punditv/screens/store/components/store_pundi_tv.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    return Scaffold(
      backgroundColor: kpurple,
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
            ),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            HeaderStore(),
            PundiTvStore(),
            Container(
                child: Image.asset(
              'assets/images/nusapay_money.png',
            ))
          ],
        ),
      ),
    );
  }
}
