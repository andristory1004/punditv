import 'package:flutter/material.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/widgets/custom_topup_pundi.dart';

class RecommentTopUp extends StatefulWidget {
  const RecommentTopUp({super.key});

  @override
  State<RecommentTopUp> createState() => _RecommentTopUpState();
}

class _RecommentTopUpState extends State<RecommentTopUp> {
  var selectedRupiah = '300';
  void _selectRupiah(rupiah) {
    setState(() {
      selectedRupiah = rupiah;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 5.0),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kwhite, width: 1))),
            child: Text(
              'Recomment Top Up',
              style: TextStyle(
                  color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: Column(
              children: [
                Wrap(
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    CustomTopupPundi(
                        images: 'assets/images/coins_popup.png',
                        coins: '50',
                        rupiah: 'Rp. 12.000',
                        onTaps: _selectRupiah,
                        isSelected: selectedRupiah == '50'),
                    CustomTopupPundi(
                        images: 'assets/images/coins_popup.png',
                        coins: '100',
                        rupiah: 'Rp. 24.000',
                        onTaps: _selectRupiah,
                        isSelected: selectedRupiah == '50'),
                    CustomTopupPundi(
                        images: 'assets/images/coins_popup.png',
                        coins: '150',
                        rupiah: 'Rp. 36.000',
                        onTaps: _selectRupiah,
                        isSelected: selectedRupiah == '50'),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    CustomTopupPundi(
                        images: 'assets/images/coins_popup.png',
                        coins: '200',
                        rupiah: 'Rp. 48.000',
                        onTaps: _selectRupiah,
                        isSelected: selectedRupiah == '50'),
                    CustomTopupPundi(
                        images: 'assets/images/coins_popup.png',
                        coins: '250',
                        rupiah: 'Rp. 60.000',
                        onTaps: _selectRupiah,
                        isSelected: selectedRupiah == '50'),
                    CustomTopupPundi(
                        images: 'assets/images/coins_popup.png',
                        coins: '300',
                        rupiah: 'Rp. 72.000',
                        onTaps: _selectRupiah,
                        isSelected: selectedRupiah == '50'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
