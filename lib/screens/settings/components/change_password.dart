import 'package:flutter/material.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:punditv/widgets/custom_form_password.dart';

import '../../../utils/constrans.dart';
import '../../../utils/font_styles.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = false;

  void _togglePassword() {
    _obscureText = !_obscureText;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _togglePassword();
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
          'Change Password',
          style: fontStylefont18,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 44),
            child: Text(
              'Change your password using a combination of letters, numbers and characters',
              style: fontStylefont18,
            ),
          ),
          Form(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Old Password',
                    style: fontStyleWhitefont14,
                  ),
                  CustomFormPassword(
                      hintText: 'Old Password',
                      controller: passwordController,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _togglePassword();
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _obscureText ? kgrayNav : kblue,
                          )),
                      prefixIcon: Icon(Icons.lock, color: kblue),
                      obscureText: _obscureText,
                      textValidator: 'Input Password',
                      keyboardType: TextInputType.visiblePassword),
                  Text(
                    'New Password',
                    style: fontStyleWhitefont14,
                  ),
                  CustomFormPassword(
                      hintText: 'New Password',
                      controller: passwordController,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _togglePassword();
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _obscureText ? kgrayNav : kblue,
                          )),
                      prefixIcon: Icon(Icons.lock, color: kblue),
                      obscureText: _obscureText,
                      textValidator: 'Input Password',
                      keyboardType: TextInputType.visiblePassword),
                  Text(
                    'Try New Password',
                    style: fontStyleWhitefont14,
                  ),
                  CustomFormPassword(
                      hintText: 'Try New Password',
                      controller: passwordController,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _togglePassword();
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _obscureText ? kgrayNav : kblue,
                          )),
                      prefixIcon: Icon(Icons.lock, color: kblue),
                      obscureText: _obscureText,
                      textValidator: 'Input Password',
                      keyboardType: TextInputType.visiblePassword),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButton(
              text: 'Change Password',
              onpress: () {
                NextScreen(
                  context,
                  NavigationScreen(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
