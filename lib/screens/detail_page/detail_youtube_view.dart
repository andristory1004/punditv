import 'dart:async';

import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:dialogs/dialogs/choice_dialog.dart';
import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:punditv/models/campaign_model.dart';
import 'package:punditv/screens/youtube_subscribes.dart/components/categories_youtube_subscribe.dart';
import 'package:punditv/services/campaign_service.dart';
import 'package:punditv/utils/navigation.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../utils/constrans.dart';

class DetailYoutubeView extends StatefulWidget {
  final String id;
  final String link;
  final int duration;
  final int campaignType;
  const DetailYoutubeView(
      {super.key,
      required this.id,
      required this.link,
      required this.duration,
      required this.campaignType});

  @override
  State<DetailYoutubeView> createState() => _DetailYoutubeViewState();
}

class _DetailYoutubeViewState extends State<DetailYoutubeView> {
  late YoutubePlayerController _controller;
  late Future<List<CampaignModel>> _fetchCampaignDetail;
  late CountDownController controller = new CountDownController();

  void onStart() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        controller.pause();
      } else {
        if (_controller.value.isFullScreen) {
          _controller.play();
          controller.resume();
        } else {
          _controller.play();
          controller.resume();
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.link)!,
        flags: YoutubePlayerFlags(
            // controlsVisibleAtStart: true,
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
          onReady: () {
            _controller.play();
            controller.start();
          },
          // onReady: onStart,
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
                      NeonCircularTimer(
                          onComplete: () {
                            _controller.pause();
                            controller.pause();
                            final choice = ChoiceDialog(
                              buttonOkOnPressed: () {
                                _controller.play();
                                ChoiceDialog().dismiss(context);
                              },
                              buttonCancelOnPressed: () {
                                NextScreen(context, NavigationScreen());
                              },
                              dialogBackgroundColor: Colors.white,
                              title: 'Pundi TV',
                              message: "congrats you got progress credit",
                            );
                            choice.show(context);
                          },
                          width: 150,
                          controller: controller,
                          duration: widget.duration,
                          strokeWidth: 10,
                          isReverse: true,
                          isTimerTextShown: true,
                          neumorphicEffect: true,
                          autoStart: false,
                          outerStrokeColor: Colors.grey.shade100,
                          innerFillGradient: LinearGradient(colors: [
                            Colors.greenAccent.shade200,
                            Colors.blueAccent.shade400
                          ]),
                          neonGradient: LinearGradient(colors: [
                            Colors.greenAccent.shade200,
                            Colors.blueAccent.shade400
                          ]),
                          strokeCap: StrokeCap.round,
                          innerFillColor: Colors.black12,
                          backgroudColor: Colors.grey.shade100,
                          neonColor: Colors.blue.shade900),
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.play_arrow,
                                  color: kwhite,
                                ),
                                onPressed: () {
                                  //   _controller.value.isPlaying
                                  //       ? paus()
                                  //       : play();
                                  setState(() {
                                    if (_controller.value.isPlaying) {
                                      _controller.pause();
                                      controller.pause();
                                    } else {
                                      _controller.play();
                                      controller.resume();
                                      // if (_controller.value.isFullScreen) {
                                      //   _controller.play();
                                      //   controller.resume();
                                      // } else {
                                      //   _controller.play();
                                      //   controller.resume();
                                      // }
                                    }
                                  });
                                }),
                            IconButton(
                              icon: Icon(
                                Icons.pause,
                                color: kwhite,
                              ),
                              onPressed: () {
                                _controller.toggleFullScreenMode();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _dragonCircle() {
    const innerMargin = 4;
    const double strokeWidth = 2;
    const Color backgroundColor = kpurpleSecond;

    final innerLayout = Container(
      width: 100,
      margin: const EdgeInsets.all(innerMargin + strokeWidth),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(150),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_pundi.png',
            width: 60,
          ),
          const Text(
            '50',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
    return innerLayout;
  }
}
