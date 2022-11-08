// import 'package:flutter/cupertino.dart';
// import 'package:punditv/models/campaign_model.dart';
// import 'package:punditv/services/api_campaign.dart';

// class CampaignProvider extends ChangeNotifier {
//   final _campaignsProvider = CampaignServices();

//   bool _isloading = false;
//   List<Campaigns> _campaigns = [];
//   Future<List<Campaigns>> get campaignes async => _campaigns;

//   Future<void> getAllCampaignse() async {
//     _isloading = true;
//     notifyListeners();
//     final response = await _campaignsProvider.getAll();
//     _campaigns = response;
//     _isloading = false;
//     notifyListeners();
//   }
// }
