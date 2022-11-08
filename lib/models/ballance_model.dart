import 'dart:convert';

import 'package:punditv/models/post_model.dart';

List<BallanceModel> postFromJson(String str) =>
    List<BallanceModel>.from(json.decode(str).map((x) => Post.fromMap(x)));

class BallanceModel {
  final int? id;
  final int? userId;
  final String? name;
  final int? ballance;

  BallanceModel(
      {required this.id,
      required this.userId,
      required this.name,
      required this.ballance});

  factory BallanceModel.fromJson(Map<String, dynamic> json) {
    return BallanceModel(
        id: json['id'],
        userId: json['user_id'],
        name: json['name'],
        ballance: json['ballance']);
  }
}
