import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:punditv/models/user_model.dart';
import 'package:punditv/screens/campaign/campaign.dart';
import 'package:punditv/screens/earning_page/earning_credit.dart';
import 'package:punditv/screens/help_center/help_center.dart';
import 'package:punditv/screens/home/home.dart';
import 'package:punditv/screens/messages/messages.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/screens/refferal/refferal.dart';
import 'package:punditv/screens/settings/setting.dart';
import 'package:punditv/screens/welcome_page/splash.dart';
import 'package:punditv/screens/wallets/wallet.dart';
import 'package:punditv/services/auth_user.dart';
import 'package:punditv/services/user_service.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../provider/sign_in_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<UserModel> getDataUser;
  // UserService fetchApiUser = UserService().getUser();
  final Uri _url = Uri.parse('https://punditv.com/');

  Future<void> _launchUrlAbout() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  void initState() {
    super.initState();
    getDataUser = UserService().getUser();
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    return Scaffold(
      backgroundColor: kpurple,
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: IconButton(
            onPressed: () => NextScreen(context, const NavigationScreen()),
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(
          'My Profile',
          style: TextStyle(color: kwhite, fontSize: 20),
        ),
        centerTitle: true,
      ),
      bottomSheet: Container(
          width: double.infinity,
          height: 30,
          decoration:
              BoxDecoration(color: kpurple, border: Border.all(color: kpurple)),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              'Pundi TV version 1.0',
              style: TextStyle(color: kwhite),
            ),
          )),
      body: FutureBuilder<UserModel>(
        future: getDataUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return Text(snapshot.data!.name.toString());
            return ListView(
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: kwhite, width: 2))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data!.picture.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.name.toString(),
                              style: TextStyle(
                                  color: kwhite,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(snapshot.data!.email.toString(),
                                style: TextStyle(
                                  color: kwhite,
                                  fontSize: 14,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // ItemProfile(),
                CustomProfile(
                    images: 'assets/images/Wallets.png',
                    texts: 'Wallets',
                    onpress: () => NextScreen(context, const WalletsScreen()),
                    icons: Icon(Icons.arrow_forward_ios)),
                CustomProfile(
                    images: 'assets/icons/chat.png',
                    texts: 'Chat',
                    onpress: () => NextScreen(
                        context,
                        MessagesScreen(
                          email: '',
                        )),
                    icons: Icon(Icons.arrow_forward_ios)),
                CustomProfile(
                    images: 'assets/images/ref.png',
                    texts: 'My Campaign',
                    onpress: () => NextScreen(context, const CampaignScreen()),
                    icons: Icon(Icons.arrow_forward_ios)),
                CustomProfile(
                    images: 'assets/images/navCoin.png',
                    texts: 'My Earning Progress',
                    onpress: () => NextScreen(context, const EarningScreen()),
                    icons: Icon(Icons.arrow_forward_ios)),
                CustomProfile(
                    images: 'assets/images/navCoin.png',
                    texts: 'Referral',
                    onpress: () => NextScreen(context, const RefferalScreen()),
                    icons: Icon(Icons.arrow_forward_ios)),
                CustomProfile(
                    images: 'assets/images/settings.png',
                    texts: 'Setting',
                    onpress: () => NextScreen(context, const SettingScreen()),
                    icons: Icon(Icons.arrow_forward_ios)),
                CustomProfile(
                    images: 'assets/images/help_center.png',
                    texts: 'Help Center',
                    onpress: () => NextScreen(context, const HelpCenter()),
                    icons: Icon(Icons.arrow_forward_ios)),
                CustomProfile(
                    images: 'assets/images/about_us.png',
                    texts: 'About Us',
                    onpress: () => _launchUrlAbout(),
                    icons: Icon(Icons.arrow_forward_ios)),
                CustomProfile(
                    images: 'assets/icons/logout.png',
                    texts: 'SignOut',
                    onpress: () {
                      // sp.userSignOut();
                      // NextScreen(context, const SplashScreen());
                      AuthUser().logOut(context);
                    },
                    icons: Icon(Icons.arrow_forward_ios)),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
