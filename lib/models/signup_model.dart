import 'package:flutter/material.dart';

class SignUpBody {
  final String name;
  final String email;
  final String password;
  final String picture;

  SignUpBody(
    this.name,
    this.email,
    this.password,
    this.picture,
  );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["email"] = email;
    data["password"] = password;
    data["picture"] = picture;
    return data;
  }
}
