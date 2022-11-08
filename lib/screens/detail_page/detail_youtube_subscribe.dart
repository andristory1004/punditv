import 'dart:async';

import 'package:flutter/material.dart';
import 'package:punditv/models/campaign_model.dart';
import 'package:punditv/utils/font_styles.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../utils/constrans.dart';

class DetailYoutubeSubscribe extends StatefulWidget {
  final String id;
  final String link;
  final int campaignType;
  const DetailYoutubeSubscribe({
    super.key,
    required this.id,
    required this.link,
    required this.campaignType,
  });

  @override
  State<DetailYoutubeSubscribe> createState() => _DetailYoutubeSubscribeState();
}

class _DetailYoutubeSubscribeState extends State<DetailYoutubeSubscribe> {
  late YoutubePlayerController _controller;
  late Future<List<CampaignModel>> _fetchCampaignDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.link)!,
        flags: YoutubePlayerFlags(
            controlsVisibleAtStart: true,
            startAt: 0,
            hideControls: true,
            autoPlay: false));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return YoutubePlayerBuilder(
          player: YoutubePlayer(
            actionsPadding: EdgeInsets.all(20),
            controller: _controller,
            aspectRatio: 16 / 9,
            showVideoProgressIndicator: true,
          ),
          builder: (context, player) {
            return Scaffold(
              backgroundColor: kpurple,
              appBar: AppBar(
                backgroundColor: kpurple,
                elevation: 0,
                title: Text('Pundi TV'),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new)),
              ),
              body: ListView(
                children: [
                  player,
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => NextScreen(context, NavigationScreen()),
                          child: Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                                color: kred,
                                borderRadius: BorderRadius.circular(17)),
                            child: Center(
                              child: Text(
                                'Subscribe',
                                style: fontStyleWhitefont14,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}
