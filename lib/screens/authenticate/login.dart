import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:provider/provider.dart';
import 'package:punditv/screens/authenticate/register.dart';
import 'package:punditv/services/auth_user.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:punditv/widgets/custom_form.dart';
import 'package:punditv/widgets/custom_form_password.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool? rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final buttonSignin = RoundedLoadingButtonController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = "andri.story1004@gmail.com";
    passController.text = "UserPunditv";
  }

  void _onRememberMeChanged(bool? newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe == true) {
          print('clicked');
        } else {
          // TODO: Forget the user
        }
      });

  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kpurple,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kpurpleSecond, Colors.black],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 44),
                  child: Image.asset(
                    'assets/images/logo_pundi.png',
                    height: 150.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 34,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            'Pelase enter email and password..!',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      CustomForm(
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email',
                          prefixIcons: Icon(
                            Icons.mail,
                            color: kblue,
                          ),
                          controllers: emailController,
                          textValidator: 'Input Email'),
                      CustomFormPassword(
                          hintText: 'Password',
                          controller: passController,
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: _obscureText ? kgrayNav : kblue)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: kblue,
                          ),
                          obscureText: _obscureText,
                          textValidator: 'Input Password!!!',
                          keyboardType: TextInputType.visiblePassword),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                child: Row(
                              children: [
                                Checkbox(
                                    checkColor: kwhiteBg,
                                    activeColor: kblue,
                                    hoverColor: kpurple,
                                    value: rememberMe,
                                    onChanged: _onRememberMeChanged),
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )),
                            SizedBox(
                              height: 16,
                            ),
                            TextButton(
                              child: Text(
                                'Forget password ?',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) {});
                              },
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // AuthUser().login(emailController, passController, context);
                          if (_formKey.currentState!.validate()) {
                            return AuthUser().login(
                                emailController, passController, context);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 15.0),
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(18)),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(color: kwhite),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 54.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have account ?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            TextButton(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: kblue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                              onPressed: () {
                                NextScreen(context, Register());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
