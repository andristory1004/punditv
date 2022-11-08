import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/font_styles.dart';

class ChangeProfile extends StatelessWidget {
  const ChangeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: kgrayText,
          ),
        ),
        title: Text(
          'Change Profile',
          style: fontStylefont18,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(color: kwhite),
            child: Center(
              child: CircleAvatar(
                backgroundColor: kpurpleSecond.withOpacity(0.8),
                radius: 35,
                child: Text(
                  'P',
                  style: fontStylefont18,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Username',
              style: fontStyleWhitefont14,
            ),
            trailing: Text(
              'Change Now',
              style: fontStyleWhitefont14,
            ),
          )
        ],
      ),
    );
  }
}
