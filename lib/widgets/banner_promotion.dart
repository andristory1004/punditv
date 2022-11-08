import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:punditv/models/banner_model.dart';
import 'package:punditv/provider/banner_provider.dart';
import 'package:punditv/utils/constrans.dart';

class BannerPromotion extends StatefulWidget {
  const BannerPromotion({super.key});

  @override
  State<BannerPromotion> createState() => _BannerPromotionState();
}

class _BannerPromotionState extends State<BannerPromotion> {
  late BannerModel bannerModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BannerProvider>(context, listen: false).getAllBanners();
    });
  }

  @override
  Widget build(BuildContext context) {
    final postBanner = Provider.of<BannerProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Consumer<BannerProvider>(
      builder: (context, value, child) {
        final banners = value.banners;
        return ListView.builder(
          itemCount: value.banners.length,
          itemBuilder: (context, index) {
            final banner = banners[index];
            return Container(
              width: double.infinity,
              height: size.height * 0.25 - 30,
              decoration: BoxDecoration(color: kpurple),
              child: CarouselSlider(
                items: [
                  CachedNetworkImage(
                    imageUrl: 'http://dashboard.punditv.com/${banner.banner}',
                    fit: BoxFit.cover,
                  )
                ],
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
