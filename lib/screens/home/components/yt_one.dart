import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punditv/models/campaign_model.dart';
import 'package:punditv/screens/earning_page/youtube_subscribes.dart';
import 'package:punditv/screens/earning_page/youtube_views.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeOne extends StatefulWidget {
  final CampaignModel? campaign;
  final String id;
  final String link;
  const YoutubeOne(
      {super.key,
      required this.campaign,
      required this.id,
      required this.link});

  @override
  State<YoutubeOne> createState() => _YoutubeOneState();
}

class _YoutubeOneState extends State<YoutubeOne> {
  final VideoURl = "https://www.youtube.com/watch?v=dRav0nmI0Qo";

  late YoutubePlayerController ytController;
  late String thumbnail;

  save() async {
    bool islogin = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("campaign_detail", jsonEncode(widget.campaign));
  }

  @override
  void initState() {
    // TODO: implement initState
    final VideoId = YoutubePlayer.convertUrlToId(widget.campaign!.link!);
    thumbnail = YoutubePlayer.getThumbnail(videoId: VideoId!);

    print(thumbnail);

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
                  NextScreen(context, YoutubeSubscribes());
                },
                child: Image.network(thumbnail),
              )
            ],
          );
        });
  }
}
