import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';

import '../add_campaign_page/add_campaign.dart';

class ContentCampaign extends StatelessWidget {
  const ContentCampaign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: kwhiteBg,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'My Campaign',
                  style: TextStyle(
                      color: kblack, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                child: GestureDetector(
                  onTap: () => _plusyoutube(context),
                  child: CircleAvatar(
                    backgroundColor: kwhiteBg,
                    radius: 15,
                    child: Image.asset('assets/images/plus.png'),
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }

  _plusyoutube(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(child: AddCampaign());
        });
  }
}
