// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:punditv/models/campaign_model.dart';
// import 'package:punditv/provider/campaign_provider.dart';
// import 'package:punditv/services/api_campaign.dart';

// import 'package:http/http.dart' as http;

// class CampaignList extends StatefulWidget {
//   const CampaignList({super.key});

//   @override
//   State<CampaignList> createState() => _CampaignListState();
// }

// class _CampaignListState extends State<CampaignList> {
//   late Future<Campaigns> campaigns;

//   @override
//   void initState() {
//     super.initState();
//     // campaigns = getCampaign();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Provider.of<CampaignProvider>(context, listen: false).getAllCampaignse();
//     });

//     // data.fetchData(context);
//   }

//   // Future<Campaigns> getCampaign() async {
//   //   final response =
//   //       await http.get(Uri.parse("http://dashboard.punditv.com/api/campaign"));
//   //   if (response.statusCode == 200) {
//   //     return Campaigns.fromJson(json.decode(response.body)[0]);
//   //   } else {
//   //     throw Exception('Failed to load campaign');
//   //   }
//   // }

//   // Future<Campaigns> getDataCampaigns(context) async {
//   //   late Campaigns campaigns;
//   //   try {
//   //     final response = await http
//   //         .get(Uri.parse("http://dashboard.punditv.com/api/campaign"));
//   //     if (response.hashCode == 200) {
//   //       final data = json.decode(response.body);
//   //       campaigns = Campaigns.fromJson(data);
//   //     } else {
//   //       print("Something went wrong");
//   //     }
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   //   return campaigns;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('data'),
//     );
//   }
// }
