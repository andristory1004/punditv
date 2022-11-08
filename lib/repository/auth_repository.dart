import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  saveSession(String accessToken) async {
    bool islogin = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('is_login', islogin);
    await pref.setString("access_token", accessToken);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
