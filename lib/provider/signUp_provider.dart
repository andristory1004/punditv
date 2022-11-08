// import 'package:flutter/cupertino.dart';
// import 'package:punditv/models/signup_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:punditv/services/api_signup.dart';

// class SignUpProvider extends ChangeNotifier {
//   bool loading = false;
//   bool isBack = false;
//   Future<void> postData(SignUpBody body) async {
//     loading = true;
//     notifyListeners();
//     http.Response response = (await register(body))!;
//     if (response.statusCode == 200) {
//       isBack = true;
//     }
//     loading = false;
//     notifyListeners();
//   }
// }
