import 'package:flutter/material.dart';
import 'package:punditv/screens/send_wallets_credit_pundi/send_wallets_credit_pundi.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SendWallets extends StatefulWidget {
  const SendWallets({super.key});

  @override
  State<SendWallets> createState() => _SendWalletsState();
}

class _SendWalletsState extends State<SendWallets> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final RoundedLoadingButtonController sendWalletPopUpController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
      width: 373,
      height: 320,
      decoration:
          BoxDecoration(color: kwhite, borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          TextFormField(
            cursorColor: kpurple,
            keyboardType: TextInputType.name,
            controller: nameController,
            decoration: InputDecoration(
                focusColor: kgray,
                hintText: ' Enter name account',
                hintStyle: TextStyle(
                  color: kgrayText,
                  fontSize: 12,
                ),
                label: Text(
                  'Name Account',
                ),
                labelStyle: TextStyle(
                    color: kblack, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          TextFormField(
            keyboardType: TextInputType.name,
            controller: emailController,
            decoration: InputDecoration(
                focusColor: kgray,
                hintText: ' Email',
                hintStyle: TextStyle(
                  color: kgrayText,
                  fontSize: 12,
                ),
                label: Text(
                  ' Enter email',
                ),
                labelStyle: TextStyle(
                    color: kblack, fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 54),
            child: CustomButton(
              text: 'Next',
              onpress: () {
                NextScreen(context, const SendWalletsCreditPundi());
              },
            ),
            //
          )
        ],
      ),
    );
  }
}
