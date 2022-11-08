import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:punditv/models/campaign_model.dart';
import 'package:punditv/models/category_model.dart';
import 'package:punditv/screens/campaign/add_campaign_page/add_campaign_subscribe.dart';
import 'package:punditv/screens/campaign/add_campaign_page/add_campaign_view.dart';
import 'package:punditv/screens/failed/failed_campaign.dart';
import 'package:punditv/screens/home/home.dart';
import 'package:punditv/services/campaign_service.dart';
import 'package:punditv/utils/font_styles.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_form_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/type_campaign_model.dart';
import '../../../utils/constrans.dart';

List<ItemTYpe> typeFromJson(String str) =>
    List<ItemTYpe>.from(json.decode(str).map((x) => ItemTYpe.fromJson(x)));

String typeToJson(List<ItemTYpe> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemTYpe {
  String? id;
  String? type;

  ItemTYpe({
    required this.id,
    required this.type,
  });

  factory ItemTYpe.fromJson(Map<String, dynamic> json) => ItemTYpe(
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };
}

class AddCampaign extends StatefulWidget {
  const AddCampaign({super.key});

  @override
  State<AddCampaign> createState() => _AddCampaignState();
}

class _AddCampaignState extends State<AddCampaign> {
  List<ItemTYpe>? optionYoutube = [];
  static String optionYoutubeStr =
      '[{"id":"1", "type":"View"}, {"id":"2", "type":"Subscribe"}]';
  List<ItemTYpe> itemList = typeFromJson(optionYoutubeStr);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var Ytype = "1";
  var category = "8";
  var optionCategories = ['Music', 'Cartun'];

  late Future<List<CategoryModel>> _futureCategory;

  @override
  void initState() {
    _futureCategory = CampaignService().getCategory();

    // resetWaktuTonton();
    // Timer.periodic(new Duration(seconds: 10), (timer) {
    //   Future<int> totalWaktu = getWaktuTonton();
    //   totalWaktu.then((int? value) => {setWaktuTonton(value)});
    // });
    super.initState();
  }

  // Future<int> getWaktuTonton() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? waktu = pref.getString("waktuTonton");
  //   if (waktu != null) {
  //     return int.parse(waktu) + 10;
  //   } else {
  //     setWaktuTonton(0);
  //     return 10;
  //   }
  // }

  // void setWaktuTonton(int? waktu) async {
  //   print(waktu.toString());
  //   int? waktuInterval = 10;
  //   int? totalWaktu = waktu! + waktuInterval;
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString("waktuTonton", totalWaktu.toString());
  // }

  // void resetWaktuTonton() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString("waktuTonton", "0");
  // }

  @override
  Widget build(BuildContext context) {
    final linkController = TextEditingController();
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        height: 400,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              'Campaign Type',
              style: TextStyle(
                  color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Campaign Type',
                    style: TextStyle(
                        color: kblack,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  DropdownButtonFormField(
                    elevation: 0,
                    items: itemList
                        .map((ItemTYpe item) => DropdownMenuItem(
                            value: item.id, child: Text(item.type.toString())))
                        .toList(),
                    onChanged: (newValue) {
                      setState(() {
                        Ytype = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(color: kgrayNav)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kblue),
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(
                              18,
                            )),
                        hintText: 'chose campaign type',
                        hintStyle: TextStyle(
                          color: kblack,
                        ),
                        // prefixIcon: Icon(Icons.youtube_searched_for_sharp),
                        prefixIconColor: kgrayNav),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Enter your yotube channel link',
                        style: TextStyle(
                            color: kblack,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: TextFormField(
                      style: TextStyle(color: kblack),
                      controller: linkController,
                      keyboardType: TextInputType.url,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "The field is required..!";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (String? val) {
                        linkController.text = val!;
                      },
                      decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(color: kgrayNav)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kblue),
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(
                                18,
                              )),
                          hintText: 'Enter your youtube link',
                          hintStyle: TextStyle(
                            color: kblack,
                          ),
                          prefixIcon: Icon(Icons.link),
                          prefixIconColor: kgrayNav),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 35),
              child: GestureDetector(
                onTap: () {
                  CampaignService()
                      .checkUrlYoutube(linkController, Ytype, category)
                      .then((value) => {
                            if (value)
                              {
                                NextScreen(
                                    context,
                                    const FailedCampaign(
                                      command:
                                          "Your link youtube is not valid..!",
                                    ))
                              }
                            else
                              {
                                if (Ytype == "1")
                                  {
                                    NextScreen(
                                        context,
                                        AddCampaignView(
                                          delivery: "0",
                                          coint: null,
                                          methodPayment: null,
                                        ))
                                  }
                                else
                                  NextScreen(
                                      context,
                                      AddCampaignSubscribe(
                                          delivery: "0",
                                          coint: 0,
                                          methodPayment: null))
                              }
                          });
                  print("Campaign Type :" + Ytype);
                },
                child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        color: kblue, borderRadius: BorderRadius.circular(32)),
                    child: Center(
                      child: Text(
                          textAlign: TextAlign.center,
                          'Next',
                          style: fontstylefont16),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
