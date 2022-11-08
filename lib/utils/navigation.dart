import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:punditv/screens/authenticate/login.dart';
import 'package:punditv/screens/campaign/campaign.dart';
import 'package:punditv/screens/earning_page/earning_credit.dart';
import 'package:punditv/screens/home/home.dart';
import 'package:punditv/screens/store/store.dart';
import 'package:punditv/screens/wallets/wallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constrans.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late int _selectedIndex = 0;
  final List _screens = [
    HomeScreen(),
    EarningScreen(),
    WalletsScreen(),
    CampaignScreen(),
    StoreScreen(),
  ];

  String accessToken = "";

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var islogin = pref.getBool("is_login");
    if (islogin != null && islogin == true) {
      setState(() {
        // var islogin = pref.getBool("is_login");
        accessToken = pref.getString("access_token")!;
      });
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  void _selectedScreen(int index) {
    setState(() {
      _selectedIndex = index;
      getPref();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: kpurple,
            elevation: 0,
            style: TabStyle.flip,
            color: kgrayNav,
            items: [
              TabItem(
                icon: ImageIcon(
                  AssetImage('assets/images/home.png'),
                  color: kgrayNav,
                ),
                title: 'Home',
              ),
              TabItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/navCoin.png'),
                    color: kgrayNav,
                  ),
                  title: 'Earn Coin'),
              TabItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/Wallets.png'),
                    color: kgrayNav,
                  ),
                  title: 'Wallets'),
              TabItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/ref.png'),
                    color: kgrayNav,
                  ),
                  title: 'Campaign'),
              TabItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/store.png'),
                    color: kgrayNav,
                  ),
                  title: 'Store'),
            ],
            initialActiveIndex: _selectedIndex,
            activeColor: kblue,
            onTap: _selectedScreen));
  }
}
