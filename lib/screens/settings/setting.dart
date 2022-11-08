import 'package:flutter/material.dart';
import 'package:punditv/screens/settings/components/security_account.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/font_styles.dart';
import 'package:punditv/utils/next_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
              color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
              onTap: () => NextScreen(context, SecurityAccountScreen()),
              leading: Icon(
                Icons.lock,
                color: kgrayText,
              ),
              title: Text(
                'Security & account',
                style: fontStyleWhiteBlack14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: kgrayText,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.credit_card,
                color: kgrayText,
              ),
              title: Text(
                'Kartu /Rekening Bank',
                style: fontStyleWhiteBlack14,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: kgrayText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
