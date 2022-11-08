import 'package:flutter/material.dart';
import 'package:punditv/models/channel_menu_home.dart';
import 'package:punditv/screens/home/components/item_channel_menu_home.dart';

class ViewsChannelHome extends StatelessWidget {
  const ViewsChannelHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: channelsMenuHome.length,
        itemBuilder: (context, index) {
          return ItemChannelMenuHome(channelsMenuHome: channelsMenuHome[index]);
        });
  }
}
