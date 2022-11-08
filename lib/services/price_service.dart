import 'dart:convert';

import 'package:punditv/models/price_model.dart';
import 'package:http/http.dart' as http;

class PriceService {
  Future<PriceModel> getEarnPriceView() async {
    String url = "https://dashboard.punditv.com/api/price/campaign/view";

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return PriceModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<PriceModel> getEarnPriceSubscribe() async {
    String url = "https://dashboard.punditv.com/api/price/campaign/subscribe";

    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return PriceModel.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
