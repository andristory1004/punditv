import 'package:flutter/material.dart';
import 'package:punditv/screens/success/success_buy_pundi.dart';
import 'package:punditv/screens/summary_topup/components/complete_summary_topup.dart';
import 'package:punditv/screens/summary_topup/components/importan_summary_topup.dart';
import 'package:punditv/screens/summary_topup/components/transfer_destination_summary_topup.dart';
import 'package:punditv/screens/summary_topup/components/transfers_amount_summary_topup.dart';
import 'package:punditv/utils/constrans.dart';
import 'package:punditv/utils/next_screen.dart';
import 'package:punditv/widgets/custom_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SummaryTopUps extends StatefulWidget {
  const SummaryTopUps({super.key});

  @override
  State<SummaryTopUps> createState() => _SummaryTopUpsState();
}

class _SummaryTopUpsState extends State<SummaryTopUps> {
  final RoundedLoadingButtonController summaryController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kpurple,
        elevation: 0,
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: Text(
          'Payment Top Up',
          style: TextStyle(
              color: kwhite, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            TransferDestinationSummaryTopUp(),
            TransfersAmountSummaryTopUp(),
            ImportantSummaryTopup(),
            CompleteSummaryTopUp(),
            Padding(
              padding: const EdgeInsets.only(top: 74, right: 24, left: 24),
              child: CustomButton(
                text: 'I Have Transferred',
                onpress: () => NextScreen(context, SuccessBuyPundi()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
