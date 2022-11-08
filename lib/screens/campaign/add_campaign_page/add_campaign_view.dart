import 'package:flutter/material.dart';
import 'package:punditv/models/price_model.dart';
import 'package:punditv/screens/campaign/add_campaign_page/add_campaign.dart';
import 'package:punditv/screens/campaign/add_campaign_page/payment_method_campaign_view.dart';
import 'package:punditv/screens/failed/failed_campaign.dart';
import 'package:punditv/services/campaign_service.dart';
import 'package:punditv/services/price_service.dart';
import 'package:punditv/services/service_api.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCampaignView extends StatefulWidget {
  final String? methodPayment;
  final int? coint;
  final String? delivery;
  const AddCampaignView(
      {super.key,
      required this.methodPayment,
      required this.coint,
      required this.delivery});

  @override
  State<AddCampaignView> createState() => _AddCampaignViewState();
}

class _AddCampaignViewState extends State<AddCampaignView> {
  String link = "";
  String campaignType = "";
  String campaignCategory = "";
  late String? _delivery;

  final RoundedLoadingButtonController controller =
      RoundedLoadingButtonController();
  final durationViewController = TextEditingController();

  late Future<PriceModel>? _futureEarnPriceView;
  late String? _methodPayment = "";
  late int _total = 0;
  late int _credit = 0;
  late int _price = 0;
  late int _discount = 0;

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    link = pref.getString('link')!;
    campaignType = pref.getString('type')!;
    campaignCategory = pref.getString('category')!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

    _futureEarnPriceView = PriceService().getEarnPriceView();

    if (widget.methodPayment == null) {
      _methodPayment = "Choose method payment";
    } else {
      _methodPayment = widget.methodPayment;
    }
    _delivery = widget.delivery;

    if (widget.coint == null) {
      _credit = 0;
    } else {
      _credit = widget.coint!;
    }

    print("Credits : " + _credit.toString());
  }

  @override
  Widget build(BuildContext context) {
    Widget summaryList(String title, String nameValue) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: kwhite, fontSize: 12)),
            Text(nameValue, style: TextStyle(color: kwhite, fontSize: 12))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: IconButton(
            onPressed: () => NextScreen(context, AddCampaign()),
            icon: Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: Text(
          'Campaign View',
          style: TextStyle(
              color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          child: ListView(
            children: [
              Container(
                width: 374,
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(color: kpurpleSecond, boxShadow: [
                  BoxShadow(
                      color: kwhite.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 2))
                ]),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'View Duration / Minute',
                          style: TextStyle(
                              fontSize: 16,
                              color: kwhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Indput Duration
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: double.infinity,
                          // height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: kgrayNav,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: TextFormField(
                              // controller: durationViewController,
                              initialValue: _delivery,
                              // autovalidateMode: AutovalidateMode.onUserInteraction,
                              onChanged: (String value) {
                                setState(() {
                                  if (value == "") {
                                    _delivery = "0";
                                  } else {
                                    _delivery = value;
                                  }
                                  print("On Change Value :" + value);
                                  print("On Change Value Delivery :" +
                                      _delivery.toString());
                                });
                              },
                              onSaved: (String? value) {
                                _delivery = value.toString();
                              },
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              FutureBuilder(
                  future: _futureEarnPriceView,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (_delivery == "0") {
                        _total = 0;
                      } else {
                        _total = snapshot.data!.price! *
                                int.parse(_delivery.toString()) -
                            snapshot.data!.sale!;
                      }
                      _price = snapshot.data!.price!;
                      _discount = snapshot.data!.sale!;
                      return Column(
                        children: [
                          Container(
                            width: 374,
                            height: 206,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                            decoration: BoxDecoration(
                                color: kpurpleSecond,
                                boxShadow: [
                                  BoxShadow(
                                      color: kwhite.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: Offset(0, 2))
                                ]),
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(8.0),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 24),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: kwhite, width: 2))),
                                    child: Text(
                                      'Summary',
                                      style: TextStyle(
                                          color: kwhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 44, top: 10, right: 24),
                                  child: Column(
                                    children: [
                                      summaryList("Campaign Type", "View"),
                                      summaryList("Delivery",
                                          _delivery.toString() + " Minute"),
                                      summaryList("Price",
                                          "${snapshot.data!.price} / Minute"),
                                      Container(
                                          margin: EdgeInsets.only(bottom: 8.0),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 2,
                                                      color: kwhite))),
                                          child: summaryList("Discount",
                                              "${snapshot.data!.sale}")),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Total Cost',
                                              style: TextStyle(
                                                  color: korangesecond,
                                                  fontSize: 12)),
                                          Text(_total.toString(),
                                              style: TextStyle(
                                                  color: korangesecond,
                                                  fontSize: 12))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Payment Method
                          Container(
                            height: 144,
                            margin: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 24.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: kpurpleSecond,
                                boxShadow: [
                                  BoxShadow(
                                      color: kwhite.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: Offset(0, 2))
                                ]),
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(5.0),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 24),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: kwhite, width: 2))),
                                    child: Text(
                                      'Payment Method',
                                      style: TextStyle(
                                          color: kwhite,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                InkWell(
                                  onTap: () => NextScreen(
                                      context,
                                      PaymentMethodCampaignViews(
                                        delivery: _delivery.toString(),
                                        campaignType: campaignType,
                                      )),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 17.0, horizontal: 10.0),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                    ),
                                    decoration: BoxDecoration(
                                        color: kgray,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          _methodPayment.toString(),
                                          style: TextStyle(
                                              color: korangesecond,
                                              fontSize: 16),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          color: korangesecond,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }),

              // Button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: CustomButton(
                  text: "Submit",
                  onpress: () {
                    print("delivery : " + _delivery.toString());
                    print("method payment : " + _methodPayment.toString());
                    if (widget.methodPayment == null) {
                      NextScreen(
                          context,
                          FailedCampaign(
                            command: "asdfas",
                          ));
                    } else {
                      if (_credit <= _total) {
                        print(_credit);
                        FailedCampaign(
                          command:
                              "Your credit ballance is not sufficient, please do a top up first..!",
                        );
                      } else {
                        // CampaignService().store(
                        //     context,
                        //     link,
                        //     campaignType,
                        //     campaignCategory,
                        //     _delivery,
                        //     "Your price campaign ${_total}",
                        //     "0");
                        CampaignService().store(
                            context,
                            link,
                            campaignType,
                            campaignCategory,
                            int.parse(_delivery.toString()),
                            "Your price campaign ${_total}",
                            null,
                            _methodPayment.toString(),
                            _price,
                            _discount,
                            _total);
                      }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
