import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:punditv/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var token = pref.getString('access_token');
    String url = "http://dashboard.punditv.com/api/profile";

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    print(response.statusCode);
    print(token);
    print(response.body);
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
