import 'package:flutter/material.dart';
import 'package:punditv/models/ballance_model.dart';
import 'package:punditv/screens/campaign/add_campaign_page/add_campaign_subscribe.dart';
import 'package:punditv/screens/campaign/add_campaign_page/add_campaign_view.dart';
import 'package:punditv/services/ballance_service.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';

class PaymentMethodCampaignViews extends StatefulWidget {
  final String campaignType;
  final String delivery;
  const PaymentMethodCampaignViews(
      {super.key, required this.campaignType, required this.delivery});

  @override
  State<PaymentMethodCampaignViews> createState() =>
      _PaymentMethodCampaignViewsState();
}

class _PaymentMethodCampaignViewsState
    extends State<PaymentMethodCampaignViews> {
  late Future<List<BallanceModel>> _futurePoint;
  late Future<List<BallanceModel>> _futurePundi;

  final String _pundi = "Credit Pundi";
  final String _point = "Credit Point";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _futurePoint = BallanceServices().getPoint();
    _futurePundi = BallanceServices().getPundi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: IconButton(
            onPressed: () => NextScreen(
                context,
                AddCampaignView(
                  delivery: widget.delivery,
                  coint: 0,
                  methodPayment: "Choose method payment",
                )),
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(
          'Campaign Payment Methode',
          style: TextStyle(
              color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24),
        child: Column(
          children: [
            FutureBuilder<List<BallanceModel>>(
              future: _futurePundi,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          setState(
                            () {
                              if (widget.campaignType == "1") {
                                NextScreen(
                                    context,
                                    AddCampaignView(
                                        delivery: widget.delivery,
                                        coint: snapshot.data![index].ballance,
                                        methodPayment: _pundi));
                              } else {
                                NextScreen(
                                    context,
                                    AddCampaignSubscribe(
                                        coint: snapshot.data![index].ballance,
                                        delivery: widget.delivery,
                                        methodPayment: _pundi));
                              }
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 24),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: kblack, width: 1))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/bi_coin.png',
                                          width: 24,
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Text(
                                          'Credits Pundi',
                                          style: TextStyle(
                                              color: kblack,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      snapshot.data![index].ballance.toString(),
                                      style: TextStyle(
                                          color: kblack,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            FutureBuilder<List<BallanceModel>>(
              future: _futurePoint,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              setState(() {
                                if (widget.campaignType == "1") {
                                  NextScreen(
                                      context,
                                      AddCampaignView(
                                          delivery: widget.delivery,
                                          coint: snapshot.data![index].ballance,
                                          methodPayment: _point));
                                } else {
                                  NextScreen(
                                      context,
                                      AddCampaignSubscribe(
                                          coint: snapshot.data![index].ballance,
                                          delivery: widget.delivery,
                                          methodPayment: _point));
                                }
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 24),
                                child: Column(children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: kblack, width: 1))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              'assets/icons/bi_coin.png',
                                              width: 24,
                                            ),
                                            SizedBox(
                                              width: 8.0,
                                            ),
                                            Text(
                                              'Credits Point',
                                              style: TextStyle(
                                                  color: kblack,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          snapshot.data![index].ballance
                                              .toString(),
                                          style: TextStyle(
                                              color: kblack,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )
                                ])),
                          ));
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
}
