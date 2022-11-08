import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:punditv/models/ballance_model.dart';
import 'package:punditv/models/campaign_model.dart';
import 'package:punditv/models/channel_info_youtube_home.dart';
import 'package:punditv/models/channel_menu_home.dart';
import 'package:punditv/models/video_list_youtube.dart';

import 'package:punditv/provider/sign_in_provider.dart';
import 'package:punditv/screens/authenticate/login.dart';
import 'package:punditv/screens/buy_pundi_topup/buy_pundi.dart';
import 'package:punditv/screens/coming_soon/coming_soon.dart';
import 'package:punditv/screens/home/components/view_channel_home.dart';
import 'package:punditv/screens/home/components/yt_one.dart';
import 'package:punditv/screens/home/profile.dart';
import 'package:punditv/screens/withdraws/withdraws.dart';
import 'package:punditv/services/ballance_service.dart';
import 'package:punditv/services/campaign_service.dart';
import 'package:punditv/services/service_api.dart';

import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/key_youtube.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:http/http.dart' as http;
import 'package:punditv/widgets/banner_iklan.dart';
import 'package:punditv/widgets/banner_promotion.dart';
import 'package:punditv/widgets/card_saldo.dart';
import 'package:punditv/widgets/card_saldo_nusapay.dart';
import 'package:punditv/widgets/custom_thumbnail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/header_home.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeScreen extends StatefulWidget {
  final List? list;
  const HomeScreen({super.key, this.list});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ChannelInfo _channelInfo;
  late VideoListYoutube _videoListYoutube;
  late Item _items;
  late bool _loading;
  late String _playlistId;
  late String _nextPageToken;

  String accessToken = "";

  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var islogin = pref.getBool("is_login");
    if (islogin != null && islogin == true) {
      setState(() {
        var islogin = pref.getBool("is_login");
        accessToken = pref.getString("access_token")!;
      });
    } else {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  late Future<List<BallanceModel>> _futurePoint;
  late Future<List<BallanceModel>> _futurePundi;
  late Future<List<CampaignModel>> _futureCampaignAll;

  @override
  void initState() {
    super.initState();
    _futurePoint = BallanceServices().getPoint();
    _futurePundi = BallanceServices().getPundi();
    _futureCampaignAll = CampaignService().getCampaignView();

    getPref();
    _getChannelInfo();

    _videoListYoutube = VideoListYoutube(videos: []);
    _videoListYoutube.videos = [];
    _loading = true;
    // list = BallanceServices().getPoint() as List?;
  }

  _getChannelInfo() async {
    _channelInfo = await Service.getChannelInfo();
    _items = _channelInfo.items[0];
    _playlistId = _items.contentDetails.relatedPlaylists.uploads;
    print('Playlist $_playlistId');
    setState(() {
      _loading = false;
    });
  }

  _videosList() async {
    VideoListYoutube tempVideosList = await Service.getVideosList(
      plaListId: _playlistId,
      pageToken: _nextPageToken,
    );
    _nextPageToken = tempVideosList.nextPageToken!;
    _videoListYoutube.videos.addAll(tempVideosList.videos);
    print('videos: ${_videoListYoutube.videos}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    Size size = MediaQuery.of(context).size;

    var buyPunditv = const BuyPundi();

    return Scaffold(
      backgroundColor: kwhiteBg,
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: Image.asset('assets/images/logo_pundi.png'),
        actions: [
          IconButton(
              onPressed: () => NextScreen(context, const ProfileScreen()),
              icon: CircleAvatar(
                backgroundColor: kpurpleSecond,
                radius: 25,
                child: Icon(Icons.person),
              ))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Container(
              height: size.height * 0.25,
              child: Stack(
                children: [
                  BannerPromotion(),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: kpurple.withOpacity(0.1),
                              offset: Offset(0, 4),
                              blurRadius: 4)
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FutureBuilder<List<BallanceModel>>(
                            future: _futurePoint,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (_, index) => CardSaldo(
                                      icon: 'assets/icons/coin_yen.png',
                                      name: "${snapshot.data![index].name}",
                                      saldo:
                                          "${snapshot.data![index].ballance}",
                                      page: buyPunditv),
                                );
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                          FutureBuilder<List<BallanceModel>>(
                            future: _futurePundi,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (_, index) => CardSaldo(
                                        icon: 'assets/icons/coin_yen.png',
                                        name: "${snapshot.data![index].name}",
                                        saldo:
                                            "${snapshot.data![index].ballance}",
                                        page: buyPunditv));
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                          CardSaldoNusapay(saldo: "500.000", page: buyPunditv)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // _buildInfo(),
            Container(
              margin: EdgeInsets.only(top: 15, right: 20, left: 20),
              child: Text(
                'Watch and get pundi Credit',
                style: TextStyle(
                    color: kblack, fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            BannerIklan(),
            FutureBuilder<List<CampaignModel>>(
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
          ],
        ),
      ),
    );
  }

  _buildInfo() {
    return _loading
        ? CircularProgressIndicator()
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                      _items.snippet.thumbnails.medium.url),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(child: Text(_items.snippet.title))
              ],
            ),
          );
  }

  _showComingSoonHome(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0,
          child: ComingSoon(),
        );
      },
    );
  }
}
