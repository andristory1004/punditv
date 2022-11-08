import 'package:flutter/material.dart';
import 'package:punditv/models/history_campaign.dart';

import '../../../utils/constrans.dart';

class ItemCampaign extends StatelessWidget {
  final HistoryCampaign historyCampaignes;
  const ItemCampaign({super.key, required this.historyCampaignes});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: kwhite,
        boxShadow: [
          BoxShadow(
              color: kblack.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 1))
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            child: Image.asset(
              historyCampaignes.thumnails,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          SizedBox(
              width: 115,
              child: Text(
                overflow: TextOverflow.clip,
                historyCampaignes.title,
                style: const TextStyle(
                    color: kblack, fontSize: 12, fontWeight: FontWeight.bold),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  historyCampaignes.type,
                  style: const TextStyle(color: kgrayText, fontSize: 12),
                ),
                Text(
                  historyCampaignes.view,
                  style: const TextStyle(
                      color: kblack, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  historyCampaignes.delivery,
                  style: const TextStyle(color: kgrayText, fontSize: 12),
                ),
                Text(
                  historyCampaignes.jumSubscribe,
                  style: const TextStyle(
                      color: kblack, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  historyCampaignes.status,
                  style: const TextStyle(color: kgrayText, fontSize: 12),
                ),
                Text(
                  historyCampaignes.valueStatus,
                  style: const TextStyle(
                      color: kblack, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
