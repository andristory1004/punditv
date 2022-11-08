import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punditv/models/campaign_model.dart';
import 'package:punditv/screens/detail_page/detail_youtube_subscribe.dart';
import 'package:punditv/screens/detail_page/detail_youtube_view.dart';
import 'package:punditv/screens/earning_page/youtube_views.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomThumbnailSubscribe extends StatefulWidget {
  final CampaignModel? campaign;
  final String id;
  final String link;
  final int campaignType;
  const CustomThumbnailSubscribe({
    super.key,
    required this.campaign,
    required this.id,
    required this.link,
    required this.campaignType,
  });

  @override
  State<CustomThumbnailSubscribe> createState() =>
      _CustomThumbnailSubscribeState();
}

class _CustomThumbnailSubscribeState extends State<CustomThumbnailSubscribe> {
  final VideoURl = "https://www.youtube.com/watch?v=dRav0nmI0Qo";

  late YoutubePlayerController ytController;
  late String CustomThumbnailSubscribe;

  save() async {
    bool islogin = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("campaign_detail", jsonEncode(widget.campaign));
  }

  @override
  void initState() {
    // TODO: implement initState
    final VideoId = YoutubePlayer.convertUrlToId(widget.campaign!.link!);
    CustomThumbnailSubscribe = YoutubePlayer.getThumbnail(videoId: VideoId!);

    print(CustomThumbnailSubscribe);

    ytController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(VideoId)!,
        flags: YoutubePlayerFlags(
            autoPlay: false, showLiveFullscreenButton: true));
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(controller: ytController),
        builder: (context, player) {
          return Column(
            children: [
              // InkWell(
              //     onTap: () {
              //       NextScreen(context, YoutubeSubscribes());
              //     },
              //     child: player)

              InkWell(
                onTap: () {
                  NextScreen(
                      context,
                      DetailYoutubeSubscribe(
                        id: widget.id,
                        link: widget.link,
                        campaignType: widget.campaignType,
                      ));
                },
                child: Image.network(CustomThumbnailSubscribe),
              )
            ],
          );
        });
  }
}
