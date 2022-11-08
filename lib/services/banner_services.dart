import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:punditv/models/banner_model.dart';
import 'package:http/http.dart' as http;

class BannerService {
  Future<List<BannerModel>> getBanners() async {
    final uri = Uri.parse("http://dashboard.punditv.com/api/public/banner");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final banners = json.map((e) {
        return BannerModel(
          id: e['id'],
          banner: e['banner'],
        );
      }).toList();
      return banners;
    }
    return [];
  }
  // Future<List<BannerModel>> getBanner() async {
  //   final response = await http
  //       .get(Uri.parse("http://dashboard.punditv.com/api/public/banner"));

  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body) as List;
  //     final banners = json.map((e) {
  //       return BannerModel(
  //         id: e['id'],
  //         banner: e['banner'],
  //       );
  //     }).toList();
  //     return banners;
  //   } else {
  //     // throw 'Error';

  //     return [];
  //   }
  // }
}
