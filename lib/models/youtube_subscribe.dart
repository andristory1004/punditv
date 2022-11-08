import 'package:flutter/material.dart';

class YoutubeViewss {
  final int id;
  final String imageUrl;
  final String thumnails;
  final String title;
  final String channels;
  final String views;

  YoutubeViewss(
    this.id,
    this.imageUrl,
    this.thumnails,
    this.title,
    this.channels,
    this.views,
  );
}

final List<YoutubeViewss> youtubeViewss = [
  YoutubeViewss(
    1,
    'assets/images/view_pundi.png',
    'assets/icons/punditv.png',
    'Tutorial Pundi TV : How to upload campaign at Pundi TV',
    'Pundi TV',
    '100k Views',
  ),
];
