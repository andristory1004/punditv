import 'dart:io';
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:punditv/models/video_list_youtube.dart';
import 'package:punditv/utils/key_youtube.dart';

import '../models/channel_info_youtube_home.dart';

class Service {
  static const CHANNEL_ID = 'UCy05ayHHthYHpFEiiH6kC1g';
  static const _baseurl = 'youtube.googleapis.com';

  // static Future<VideoList> get videoList {
  //   return videoList;
  // }

  // curl \
  // 'https://youtube.googleapis.com/youtube/v3/channels?part=snippet%2CcontentDetails%2Cstatistics&id=UCy05ayHHthYHpFEiiH6kC1g&access_token=AIzaSyA_4mHIdbCnxVCCFXShD8EtM0SSCsgkzD8&key=[YOUR_API_KEY]' \
  // --header 'Authorization: Bearer [YOUR_ACCESS_TOKEN]' \
  // --header 'Accept: application/json' \
  // --compressed

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': CHANNEL_ID,
      'key': ApiKeyYoutube.API_KEY,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    Uri uri = Uri.https(_baseurl, 'youtube/v3/channels', parameters);
    Response response = await http.get(uri, headers: headers);
    print(response);

    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

  static Future<VideoListYoutube> getVideosList(
      {String? plaListId, String? pageToken}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': plaListId!,
      'maxResults': '9',
      'pageToken': pageToken!,
      // 'key': API_KEY
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    Uri uri = Uri.https(_baseurl, 'youtube/v3/playlistItems', parameters);
    Response response = await http.get(uri, headers: headers);

    // print(response.body);
    VideoListYoutube videosList = videoListYoutubeFromJson(response.body);
    return videosList;
  }
}
