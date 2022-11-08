import 'package:dialogs/dialogs/choice_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:punditv/models/price_model.dart';
import 'package:punditv/screens/campaign/add_campaign_page/add_campaign.dart';
import 'package:punditv/screens/campaign/add_campaign_page/payment_method_campaign_view.dart';
import 'package:punditv/screens/failed/failed_campaign.dart';
import 'package:punditv/screens/success/success_campaign.dart';
import 'package:punditv/services/campaign_service.dart';
import 'package:punditv/services/price_service.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AddCampaignSubscribe extends StatefulWidget {
  final String? methodPayment;
  final int? coint;
  final String? delivery;
  const AddCampaignSubscribe(
      {super.key,
      required this.methodPayment,
      required this.coint,
      required this.delivery});

  @override
  State<AddCampaignSubscribe> createState() => _AddCampaignSubscribeState();
}

class _AddCampaignSubscribeState extends State<AddCampaignSubscribe> {
  String link = "";
  String campaignType = "";
  String campaignCategory = "";
  String _delivery = "0";

  int _valueRadio = 1;

  final RoundedLoadingButtonController controller =
      RoundedLoadingButtonController();
  final durationViewController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late Future<PriceModel>? _futureEarnPriceSubscribe;
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
    print("Link Punditv : " + link);
    print("Link Punditv : " + campaignType);
    print("Link Punditv : " + campaignCategory);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

    _futureEarnPriceSubscribe = PriceService().getEarnPriceSubscribe();

    if (widget.methodPayment == null) {
      _methodPayment = "Choose method payment";
    } else {
      _methodPayment = widget.methodPayment;
    }
    _delivery = widget.delivery.toString();

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
            onPressed: () => NextScreen(context, const AddCampaign()),
            icon: Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: Text(
          'Campaign Subscribe',
          style: TextStyle(
              color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: _formKey,
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
                          'Number Of Subscribe',
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
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "The field is required..!";
                                }
                                return null;
                              },
                              onSaved: (String? value) {
                                _delivery = value.toString();
                              },
                              onChanged: (String value) {
                                setState(() {
                                  if (value == "") {
                                    _delivery = "0";
                                  } else {
                                    _delivery = value;
                                  }
                                  print("_delivery : " + _delivery.toString());
                                });
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
                  future: _futureEarnPriceSubscribe,
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
                      return Container(
                        width: 374,
                        height: 206,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 24),
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
                              padding:
                                  EdgeInsets.only(left: 44, top: 10, right: 24),
                              child: Column(
                                children: [
                                  summaryList("Campaign Type", "Subscribe"),
                                  summaryList("Delivery",
                                      _delivery.toString() + " Subscribe"),
                                  summaryList("Price",
                                      "${snapshot.data!.price} / Subscribe"),
                                  Container(
                                      margin: EdgeInsets.only(bottom: 8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 2, color: kwhite))),
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
                                      Text(
                                          // '${snapshot.data!.price! * int.parse(_delivery) - snapshot.data!.sale!} Credit',

                                          '${_total} Credit',

                                          // "Credit",
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
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }),

              // Payment Method
              Container(
                height: 144,
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 24.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: kpurpleSecond, boxShadow: [
                  BoxShadow(
                      color: kwhite.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 2))
                ]),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5.0),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: kwhite, width: 2))),
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
                              delivery: _delivery, campaignType: campaignType)),
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
                              style:
                                  TextStyle(color: korangesecond, fontSize: 16),
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

              // Button
              CustomButton(
                text: "Submit",
                onpress: () {
                  print("delivery : " + _delivery.toString());
                  print("method payment : " + _methodPayment.toString());
                  if (_methodPayment == "Choose method payment") {
                    // ChoiceDialog(
                    //   message: "Pleace chose methode payment..!",
                    //   buttonCancelText: "Ok",
                    // );
                    NextScreen(
                        context,
                        FailedCampaign(
                          command: "you forgot to choose a payment method..1",
                        ));
                  } else {
                    if (_credit <= _total) {
                      NextScreen(
                          context,
                          FailedCampaign(
                            command:
                                "Your credit ballance is not sufficient, please do a top up first..!",
                          ));
                    } else {
                      CampaignService().store(
                          context,
                          link,
                          campaignType,
                          campaignCategory,
                          null,
                          "Your price campaign ${_total}",
                          int.parse(_delivery),
                          _methodPayment.toString(),
                          _price,
                          _discount,
                          _total);
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
