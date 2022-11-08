import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:punditv/models/ballance_model.dart';
import 'package:punditv/models/post_model.dart';
import 'package:punditv/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BallanceServices {
  Future<List<BallanceModel>> getPoint() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      var token = pref.getString('access_token');
      String url = "http://dashboard.punditv.com/api/credit-point";

      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.statusCode);
      print(token);
      print(response.body);
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

        return parsed
            .map<BallanceModel>((json) => BallanceModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<BallanceModel>> getPundi() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var token = pref.getString('access_token');
    String url = "http://dashboard.punditv.com/api/credit-pundi";

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.statusCode);
    print(token);
    print(response.body);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<BallanceModel>((json) => BallanceModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
