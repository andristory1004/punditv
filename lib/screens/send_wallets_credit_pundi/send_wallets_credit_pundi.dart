import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:punditv/screens/success/success_send_wallets.dart';
import 'package:punditv/screens/success/success_withdraws.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SendWalletsCreditPundi extends StatefulWidget {
  const SendWalletsCreditPundi({super.key});

  @override
  State<SendWalletsCreditPundi> createState() => _SendWalletsCreditPundiState();
}

class _SendWalletsCreditPundiState extends State<SendWalletsCreditPundi> {
  final RoundedLoadingButtonController sendWalletController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpurple,
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Container(
        child: Column(
          children: [
            AccountRreceiveSendWallets(),
            WriteNoteSendWallets(),
            ButtonSendWallets(sendWalletController: sendWalletController)
          ],
        ),
      ),
    );
  }
}

class ButtonSendWallets extends StatelessWidget {
  const ButtonSendWallets({
    Key? key,
    required this.sendWalletController,
  }) : super(key: key);

  final RoundedLoadingButtonController sendWalletController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: CustomButton(
        text: 'Send',
        onpress: () => NextScreen(context, const SuccessSendWallets()),
      ),
    );
  }
}

class WriteNoteSendWallets extends StatelessWidget {
  const WriteNoteSendWallets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: 374,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 34),
      decoration: BoxDecoration(
          color: kpurpleSecond,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: kwhite.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 2))
          ]),
      child: InkWell(
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Write note',
                style: TextStyle(color: kgrayText, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountRreceiveSendWallets extends StatelessWidget {
  const AccountRreceiveSendWallets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
      decoration: BoxDecoration(color: kpurpleSecond, boxShadow: [
        BoxShadow(
            color: kwhite.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 1))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: kwhite, width: 2))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Account Receiver',
                  style: TextStyle(
                      color: kwhite, fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/account.png',
                        width: 41,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name Account',
                            style: TextStyle(
                                color: kwhite,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'sample@gmail.com',
                            style: TextStyle(
                              color: kwhite,
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Number of Coins',
                  style: TextStyle(
                      color: kwhite, fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Lottie.network(
                        'https://assets3.lottiefiles.com/temp/lf20_pO3t5Q.json',
                        width: 50),
                    Text(
                      '0',
                      style: TextStyle(
                          color: kgrayText,
                          fontSize: 32,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Current Coins',
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '200.000',
                      style: TextStyle(
                          color: kwhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
