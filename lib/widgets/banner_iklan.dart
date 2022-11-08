import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:punditv/provider/banner_provider.dart';
import 'package:punditv/utils/constrans.dart';

class BannerIklan extends StatefulWidget {
  const BannerIklan({super.key});

  @override
  State<BannerIklan> createState() => _BannerIklanState();
}

class _BannerIklanState extends State<BannerIklan> {
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
    return Consumer<BannerProvider>(builder: (context, value, child) {
      final banners = value.banners;
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        width: double.infinity,
        height: size.height * 0.25 - 30,
        decoration: BoxDecoration(
            color: kpurple, borderRadius: BorderRadius.circular(5)),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value.banners.length,
          itemBuilder: (context, index) {
            final banner = banners[index];
            return CarouselSlider(
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
            );
          },
        ),
      );
    });
  }
}
