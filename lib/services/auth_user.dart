import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:punditv/repository/auth_repository.dart';
import 'package:punditv/screens/authenticate/login.dart';
import 'package:punditv/screens/home/home.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/widgets/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthUser {
  void login(TextEditingController emailController,
      TextEditingController passController, BuildContext context) async {
    try {
      final GlobalKey<State> _keyLoader = GlobalKey<State>();

      if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
        String url = "http://dashboard.punditv.com/api/login";
        var response = await http.post(Uri.parse(url),
            body: ({
              'email': emailController.text,
              'password': passController.text
            }));

        final output = jsonDecode(response.body);

        print(response.body);
        print(response.statusCode);
        print(output['access_token']);

        if (response.statusCode == 200) {
          AuthRepository().saveSession(output['access_token']);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NavigationScreen()));
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content: Text(
          //   output['message'],
          //   style: const TextStyle(fontSize: 16),
          // )));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Invalid Login..!")));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Login..!")));
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }

  // Validate Input
  void _validateInputs(
      TextEditingController emailController,
      TextEditingController passController,
      BuildContext context,
      GlobalKey<FormState> _formKey) {
    if (_formKey.currentState!.validate()) {
      //If all data are correct then save data to out variables
      _formKey.currentState!.save();

      login(emailController, passController, context);
    }
  }

  // Check Login
  void ceckLogin(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var islogin = pref.getBool("is_login");
    if (islogin != null && islogin) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        ),
        (route) => false,
      );
    }
  }

  // Logout
  void logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("is_login");
    preferences.remove("access_token");

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  // Register
  void register(
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController passController,
      BuildContext context) async {
    String url = "http://dashboard.punditv.com/api/register";
    var response = await http.post(Uri.parse(url),
        // body: json.encode({
        body: ({
          'name': nameController.text,
          'email': emailController.text,
          'password': passController.text
        }));

    final outPut = jsonDecode(response.body);

    print(response.body);
    print(response.statusCode);
    print(outPut['access_token']);

    if (response.statusCode == 200) {
      // AuthRepository().saveSession(outPut['access_token']);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => NavigationScreen()));
      if (outPut['access_token'] == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("The email has already been taken..!")));
      } else {
        AuthRepository().saveSession(outPut['access_token']);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigationScreen()));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Register failed..!")));
    }
  }
}
