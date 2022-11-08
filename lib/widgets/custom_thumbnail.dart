import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:punditv/models/campaign_model.dart';
import 'package:punditv/screens/detail_page/detail_youtube_view.dart';
import 'package:punditv/screens/earning_page/youtube_views.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomThumbnail extends StatefulWidget {
  final CampaignModel? campaign;
  final String id;
  final String link;
  final int watch;
  final int campaignType;
  const CustomThumbnail(
      {super.key,
      required this.campaign,
      required this.id,
      required this.link,
      required this.watch,
      required this.campaignType});

  @override
  State<CustomThumbnail> createState() => _CustomThumbnailState();
}

class _CustomThumbnailState extends State<CustomThumbnail> {
  late YoutubePlayerController ytController;
  late String CustomThumbnail;

  save() async {
    bool islogin = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("campaign_detail", jsonEncode(widget.campaign));
  }

  @override
  void initState() {
    // TODO: implement initState
    final VideoId = YoutubePlayer.convertUrlToId(widget.campaign!.link!);
    CustomThumbnail = YoutubePlayer.getThumbnail(videoId: VideoId!);

    print(CustomThumbnail);

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
                    DetailYoutubeView(
                      id: widget.id,
                      link: widget.link,
                      duration: widget.watch,
                      campaignType: widget.campaignType,
                    ));
              },
              child: Image.network(CustomThumbnail),
            )
          ],
        );
      },
    );
  }
}
