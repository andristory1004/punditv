import 'package:flutter/material.dart';

void NextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void NextScreenReplacement(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
