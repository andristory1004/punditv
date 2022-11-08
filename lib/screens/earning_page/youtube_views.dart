import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:punditv/models/campaign_model.dart';
import 'package:punditv/services/campaign_service.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/widgets/custom_thumbnail.dart';

class YoutubeViews extends StatefulWidget {
  const YoutubeViews({super.key});

  @override
  State<YoutubeViews> createState() => _YoutubeViewsState();
}

class _YoutubeViewsState extends State<YoutubeViews> {
  late Future<List<CampaignModel>> _futureCampaignAll;

  @override
  void initState() {
    //
    super.initState();

    _futureCampaignAll = CampaignService().getCampaignView();
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
        title: Text("Campaign View"),
      ),
      backgroundColor: kpurple,
      body: FutureBuilder<List<CampaignModel>>(
        future: _futureCampaignAll,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomThumbnail(
                  campaign: snapshot.data![index],
                  id: snapshot.data![index].id!.toString(),
                  link: snapshot.data![index].link!,
                  watch: snapshot.data![index].watch_time!,
                  campaignType: snapshot.data![index].campaign_type_id!,
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
