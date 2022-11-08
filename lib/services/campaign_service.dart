import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:punditv/models/campaign_model.dart';
import 'package:punditv/models/category_model.dart';
import 'package:punditv/models/type_campaign_model.dart';
import 'package:punditv/repository/auth_repository.dart';
import 'package:punditv/screens/home/home.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/screens/success/success_campaign.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CampaignService {
  Future<List<CampaignModel>> getCampaignView() async {
    try {
      String url = "http://dashboard.punditv.com/api/public/campaign/view";

      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      print("Status Code : " + response.statusCode.toString());
      // print(response.body);
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

        return parsed
            .map<CampaignModel>((json) => CampaignModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<CampaignModel>> getCampaignSubscribe() async {
    String url = "http://dashboard.punditv.com/api/public/campaign/subscribe";

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<CampaignModel>((json) => CampaignModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<CampaignModel>> detailCampaign(String id) async {
    String url = "http://dashboard.punditv.com/api/public/campaign/$id";

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<CampaignModel>((json) => CampaignModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<CampaignModel>> getCampaign() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var token = pref.getString('access_token');
    String url = "http://dashboard.punditv.com/api/campaign";

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
          .map<CampaignModel>((json) => CampaignModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<CategoryModel>> getCategory() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    var token = pref.getString('access_token');
    String url = "http://dashboard.punditv.com/api/categories";

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var result = json.decode(response.body);
    print(response.statusCode);
    print(token);
    print(response.body);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<CategoryModel>((json) => CategoryModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> checkUrlYoutube(TextEditingController linkController,
      String Ytype, String category) async {
    if (linkController.text == "") return true;
    print(linkController);

    final response = await http.get(Uri.parse(linkController.text), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var string = response.body;
      var ytExist = string.contains('<meta name="title" content="">');
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString('link', linkController.text);
      await pref.setString('type', Ytype);
      await pref.setString('category', category);
      return ytExist;
    } else {
      throw Exception('Failed to load album');
    }
  }

  void store(
    BuildContext context,
    String link,
    String campaignType,
    String campaignCategory,
    int? watchTime,
    String messageSuccess,
    int? numberOfSubscribe,
    String methodPayment,
    int price,
    int discount,
    int total,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('access_token');

    String url = "http://dashboard.punditv.com/api/campaign.store";
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'link': link,
          'campaign_type_id': int.parse(campaignType),
          'campaign_category_id': int.parse(campaignCategory),
          'watch_time': watchTime,
          'number_of_subscribe': numberOfSubscribe,
          'method_payment': methodPayment,
          'price': price,
          'sale': discount,
          'total': total
        }));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SuccessCampaign(
                    messageSuccessCampaign: messageSuccess,
                  )));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Campaign failed..!")));
    }
  }
}
