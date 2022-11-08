import 'package:flutter/material.dart';

import '../../../utils/constrans.dart';

class EarnCoinProgress extends StatefulWidget {
  const EarnCoinProgress({super.key});

  @override
  State<EarnCoinProgress> createState() => _EarnCoinProgressState();
}

class _EarnCoinProgressState extends State<EarnCoinProgress> {
  static double _lowerValue = 1;
  static double _upperValue = 20;
  static double _min = 1;
  static double _max = 60;

  RangeValues values = RangeValues(_lowerValue, _upperValue);
  RangeValues values2 = RangeValues(_min, _max);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: kwhiteBg,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Earning Progress',
          style: TextStyle(
              color: kpurple, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 44.0, top: 5.0),
                child: Text('View Duration',
                    style: TextStyle(
                        color: kblack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    thumbColor: kpurple,
                    trackHeight: 3,
                    minThumbSeparation: 100,
                    valueIndicatorColor: kpurple,
                    overlappingShapeStrokeColor: kblue,
                    overlayColor: kblue),
                child: RangeSlider(
                    activeColor: kpurple,
                    inactiveColor: kblue,
                    labels: RangeLabels(
                        values2.start.toString(), values2.end.toString()),
                    min: _min,
                    max: _max,
                    divisions: 60,
                    values: values2,
                    onChanged: (val) {
                      setState(() {
                        values2 = val;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1 Minute',
                      style: TextStyle(color: kblack, fontSize: 12)),
                  Text('60 Minute',
                      style: TextStyle(color: kblack, fontSize: 12)),
                ],
              )
            ],
          ),
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 44.0),
                child: Text('Amount Subscribe',
                    style: TextStyle(
                        color: kblack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    valueIndicatorColor: kpurple,
                    overlappingShapeStrokeColor: kblue,
                    trackHeight: 3,
                    minThumbSeparation: 100,
                    overlayColor: kblue),
                child: RangeSlider(
                    activeColor: kpurple,
                    inactiveColor: kblue,
                    labels: RangeLabels(
                        values.start.toString(), values.end.toString()),
                    min: _lowerValue,
                    max: _upperValue,
                    divisions: 20,
                    values: values,
                    onChanged: (val) {
                      setState(() {
                        values = val;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1 Subscribe',
                      style: TextStyle(color: kblack, fontSize: 12)),
                  Text('20 Subscribe',
                      style: TextStyle(color: kblack, fontSize: 12)),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
