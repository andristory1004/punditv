import 'package:flutter/material.dart';
import 'package:punditv/models/user_model.dart';
import 'package:punditv/screens/settings/components/change_password.dart';
import 'package:punditv/screens/settings/components/change_profile.dart';
import 'package:punditv/services/user_service.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/font_styles.dart';
import 'package:punditv/utils/next_screen.dart';

class SecurityAccountScreen extends StatefulWidget {
  const SecurityAccountScreen({super.key});

  @override
  State<SecurityAccountScreen> createState() => _SecurityAccountScreenState();
}

class _SecurityAccountScreenState extends State<SecurityAccountScreen> {
  late Future<UserModel> getDataUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataUser = UserService().getUser();
  }

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
          'security and account',
          style: fontStylefont18,
        ),
      ),
      body: FutureBuilder<UserModel>(
        future: getDataUser,
        builder: (context, snapshoot) {
          if (snapshoot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    onTap: () => NextScreen(context, ChangeProfile()),
                    leading: Text(
                      'My Profile',
                      style: fontStyleWhitefont14,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: kgrayText,
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      'Username',
                      style: fontStyleWhitefont14,
                    ),
                    trailing: Text(
                      snapshoot.data!.name.toString(),
                      style: fontStyleWhitefont14,
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      'Email',
                      style: fontStyleWhitefont14,
                    ),
                    trailing: Text(
                      snapshoot.data!.email.toString(),
                      style: fontStyleWhitefont14,
                    ),
                  ),
                  ListTile(
                      onTap: () => NextScreen(context, ChangePassword()),
                      leading: Text(
                        'Change Password',
                        style: fontStyleWhitefont14,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: kgrayText,
                      ))
                ],
              ),
            );
          } else if (snapshoot.hasError) {
            return Text('${snapshoot.error}');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
