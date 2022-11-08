import 'package:flutter/material.dart';
import 'package:punditv/models/channel_menu_home.dart';
import 'package:punditv/utils/constrans.dart';

class ItemChannelMenuHome extends StatelessWidget {
  final ChannelMenuHome channelsMenuHome;
  const ItemChannelMenuHome({super.key, required this.channelsMenuHome});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kwhiteBg),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
        child: Container(
          width: 374,
          height: 100,
          margin: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: kpurple.withOpacity(0.1),
                    offset: Offset(0, 2),
                    blurRadius: 10)
              ]),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 8),
                width: 130,
                height: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    channelsMenuHome.images,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        channelsMenuHome.title,
                        style: TextStyle(color: kpurple, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Row(
                          children: [
                            Image.asset(
                              channelsMenuHome.icon,
                              width: 50,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  channelsMenuHome.youtube,
                                  style:
                                      TextStyle(color: kpurple, fontSize: 12),
                                ),
                                Text(
                                  channelsMenuHome.subscribes,
                                  style:
                                      TextStyle(color: kpurple, fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
