import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:punditv/models/campaign_model.dart';
import 'package:punditv/services/campaign_service.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/widgets/custom_thumbnail.dart';
import 'package:punditv/widgets/custom_thumbnail_subscribe.dart';

class YoutubeSubscribes extends StatefulWidget {
  const YoutubeSubscribes({super.key});

  @override
  State<YoutubeSubscribes> createState() => _YoutubeSubscribesState();
}

class _YoutubeSubscribesState extends State<YoutubeSubscribes> {
  late Future<List<CampaignModel>> _futureCampaignSubscribe;

  @override
  void initState() {
    //
    super.initState();

    _futureCampaignSubscribe = CampaignService().getCampaignSubscribe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text("Campaign Subscribe"),
      ),
      backgroundColor: kpurple,
      body: FutureBuilder<List<CampaignModel>>(
        future: _futureCampaignSubscribe,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomThumbnailSubscribe(
                      campaign: snapshot.data![index],
                      id: snapshot.data![index].id!.toString(),
                      link: snapshot.data![index].link!,
                      campaignType: snapshot.data![index].campaign_type_id!,
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
