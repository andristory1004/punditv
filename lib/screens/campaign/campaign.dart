import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:punditv/models/campaign_model.dart';
import 'package:punditv/models/history_campaign.dart';
import 'package:punditv/provider/sign_in_provider.dart';
import 'package:punditv/screens/campaign/add_campaign_page/add_campaign.dart';
import 'package:punditv/screens/campaign/components/campaign_list.dart';
import 'package:punditv/screens/campaign/components/content_campaign.dart';
import 'package:punditv/screens/campaign/components/header_campaign.dart';
import 'package:punditv/screens/campaign/components/item_campaign.dart';
import 'package:punditv/screens/home/profile.dart';
import 'package:punditv/screens/wallets/components/item_history_wallet.dart';
import 'package:punditv/services/campaign_service.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';

import '../../models/history_transaction_wallets.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> {
  late Future<List<CampaignModel>> _futureCampaign;
  late String campaignType = "View";
  late int delivery = 0;
  late String deliveryTitle = "Minute";

  @override
  void initState() {
    super.initState();

    _futureCampaign = CampaignService().getCampaign();
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();

    Widget textStatus(String title, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: kgrayText, fontSize: 12),
            ),
            Text(
              value,
              style: TextStyle(
                  color: kblack, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: kpurple,
        appBar: AppBar(
          backgroundColor: kpurple,
          elevation: 0,
          leading: Image.asset('assets/images/punditv_logo.png'),
          actions: [
            IconButton(
              onPressed: () => NextScreen(context, const ProfileScreen()),
              icon: CircleAvatar(
                backgroundColor: kpurpleSecond,
                radius: 25,
                child: Icon(Icons.person),
              ),
            )
          ],
        ),
        body: Container(
            child: Column(children: [
          HeaderCampaign(),
          ContentCampaign(), // Expanded(child: CampaignList())
          Expanded(
              child: Container(
                  decoration: BoxDecoration(color: kwhiteBg),
                  child: FutureBuilder<List<CampaignModel>>(
                    future: _futureCampaign,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) {
                              if (snapshot.data![index].campaign_type_id == 1) {
                                campaignType = "View";
                                delivery = snapshot.data![index].watch_time!;
                                deliveryTitle = "Minute";
                              } else {
                                campaignType = "Subscribe";
                                deliveryTitle = "Subscribe";
                                if (snapshot
                                        .data![index].number_of_subscribes ==
                                    null) {
                                  delivery = 0;
                                } else {
                                  delivery = snapshot
                                      .data![index].number_of_subscribes!;
                                }
                              }
                              return Container(
                                  width: double.infinity,
                                  height: 70,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 8.0),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 3.0, horizontal: 8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: kwhite,
                                    boxShadow: [
                                      BoxShadow(
                                          color: kblack.withOpacity(0.1),
                                          blurRadius: 10,
                                          offset: Offset(0, 1))
                                    ],
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 25,
                                              child: Image.asset(
                                                  'assets/icons/punditv.png'),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            // Container(
                                            //     child: Text(
                                            //   maxLines: 3,
                                            //   overflow: TextOverflow.clip,
                                            //   'How to Uploads Videos at Pundi TV',
                                            //   style: TextStyle(
                                            //       color: kblack,
                                            //       fontSize: 12,
                                            //       fontWeight: FontWeight.bold),
                                            // )),
                                          ],
                                        ),
                                        textStatus(
                                            "Type",
                                            // snapshot.data![index].campaign_type_id!.toString()
                                            campaignType),
                                        textStatus("Delivery",
                                            '${delivery.toString()} $deliveryTitle'),
                                        // "${snapshot.data![index].watch_time!.toString()} "),
                                        textStatus("Status", "0 %")
                                      ]));
                            });
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )))
        ])));
  }
}
