// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(
    json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  BannerModel({
    required this.id,
    required this.banner,
  });

  final int id;

  final String banner;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"] ?? "",
        banner: json["banner"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner": banner,
      };
}
