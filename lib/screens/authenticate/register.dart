import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:punditv/screens/authenticate/login.dart';
import 'package:punditv/services/auth_user.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/widgets/custom_form.dart';
import 'package:punditv/widgets/custom_form_password.dart';
import 'package:punditv/widgets/custom_form_text.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  bool? rememberMe = false;

  // final nameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final buttonSignUp = RoundedLoadingButtonController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      padding: EdgeInsets.only(
        bottom: 20,
        top: 40,
        left: 20,
        right: 20,
      ),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kpurpleSecond, Colors.black])),
      child: ListView(
        children: [
          Image.asset(
            'assets/images/logo_pundi.png',
            height: 100.0,
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
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
                        'Please enter your data to register..!',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  CustomFormText(
                      hintText: 'Username',
                      prefixIcons: Icon(
                        Icons.person,
                        color: kblue,
                      ),
                      controllers: nameController,
                      textValidator: 'Input name',
                      keyboardType: TextInputType.name),
                  CustomForm(
                      hintText: 'Email',
                      prefixIcons: Icon(
                        Icons.mail,
                        color: kblue,
                      ),
                      controllers: emailController,
                      textValidator: 'Input Email',
                      keyboardType: TextInputType.emailAddress),
                  CustomFormPassword(
                      hintText: 'Password',
                      controller: passController,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {});
                            _obscureText = !_obscureText;
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: _obscureText ? kgrayNav : kblue,
                          )),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: kblue,
                      ),
                      obscureText: _obscureText,
                      textValidator: 'Input Password !!!',
                      keyboardType: TextInputType.visiblePassword),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 10.0),
                  //   child: CustomButton(
                  //       text: 'Register',
                  //       onpress: () {
                  //         AuthUser().register(nameController,
                  //             emailController, passController, context);
                  //       },
                  //       controller: buttonSignUp),
                  // ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        return AuthUser().register(nameController,
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
                          'Register',
                          style: TextStyle(color: kwhite),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 44.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Already have an Account ?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
