import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:punditv/models/banner_model.dart';
import 'package:punditv/services/banner_services.dart';

class BannerProvider extends ChangeNotifier {
  final _banner = BannerService();
  bool isLoading = false;
  List<BannerModel> _banners = [];
  List<BannerModel> get banners => _banners;
  Future<void> getAllBanners() async {
    isLoading = true;
    notifyListeners();
    final response = await _banner.getBanners();
    _banners = response;
    isLoading = false;
    notifyListeners();
  }
}
