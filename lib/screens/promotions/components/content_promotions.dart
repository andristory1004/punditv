import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constrans.dart';
import '../../../widgets/custom_promotions.dart';

class ContentPromotion extends StatefulWidget {
  const ContentPromotion({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentPromotion> createState() => _ContentPromotionState();
}

class _ContentPromotionState extends State<ContentPromotion> {
  final Uri _urlIg =
      Uri.parse('https://instagram.com/pundi.tv?igshid=YmMyMTA2M2Y=');

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CustomPromotions(
                images: 'assets/icons/facebook.png',
                title: 'Like us on Facebook',
                texts: 'Like the official',
                pundi: 'PundiTV',
                texts2: 'Facebook page and receive 100 Coin',
                onTap: () {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CustomPromotions(
                images: 'assets/icons/ig.png',
                title: 'Follow our Instagram',
                texts: 'Follow the official ',
                pundi: 'PundiTV',
                texts2: 'Facebook page and receive 100 Coin',
                onTap: () => _launchInstagram()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CustomPromotions(
                images: 'assets/icons/twitter.png',
                title: 'Follow our Twitter',
                texts: 'Like the official',
                pundi: 'PundiTV',
                texts2: 'Facebook page and receive 100 Coin',
                onTap: () {}),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CustomPromotions(
                images: 'assets/images/youtube.png',
                title: 'Upload a Youtube Vidio about PundiTV',
                texts: 'Upload an original youtube vidio about',
                pundi: 'PundiTV',
                texts2: 'and recive 2.500 Coin',
                onTap: () {}),
          ),
        ],
      ),
    );
  }

  Future<void> _launchInstagram() async {
    if (!await launchUrl(_urlIg)) {
      throw 'Could not launch $_urlIg';
    }
  }
}
