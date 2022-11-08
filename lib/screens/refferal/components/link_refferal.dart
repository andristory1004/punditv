import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/constrans.dart';

class LinkRefferal extends StatelessWidget {
  const LinkRefferal({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
        color: kwhiteBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 24.0),
            decoration: BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      color: kblack.withOpacity(0.1))
                ]),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                  decoration: BoxDecoration(color: kwhiteBg, boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        color: kblack.withOpacity(0.1))
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Your Referral Link',
                        style: TextStyle(
                            color: kblack,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Wrap(
                    children: [
                      Text(
                        overflow: TextOverflow.fade,
                        "New users are good for us, and good for you! Introduce new people, who haven't used YTMonster before, through your personal link, and receive great benefits",
                        style: TextStyle(
                          color: kpurple,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 24),
                  decoration: BoxDecoration(
                      color: kwhiteBg, borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(data),
                      InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: data));
                        },
                        child: Container(
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                                color: kpurple,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.copy,
                                  color: kgray,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  'Copy',
                                  style: TextStyle(
                                      color: kwhite,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    InkWell(
                      child: Image.asset(
                        'assets/icons/wa.png',
                        width: 30,
                      ),
                    ),
                    InkWell(
                      child: Image.asset(
                        'assets/icons/facebook.png',
                        width: 30,
                      ),
                    ),
                    InkWell(
                      child: Image.asset(
                        'assets/icons/tik_tok.png',
                        width: 30,
                      ),
                    ),
                    InkWell(
                      child: Image.asset(
                        'assets/icons/ig.png',
                        width: 30,
                      ),
                    ),
                    InkWell(
                      child: Image.asset(
                        'assets/icons/twitter.png',
                        width: 30,
                      ),
                    ),
                    InkWell(
                      child: Image.asset(
                        'assets/icons/telegram.png',
                        width: 30,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 30),
                  child: Wrap(
                    children: [
                      Text(
                        overflow: TextOverflow.fade,
                        'Most benefits from acquiring referrals will unlock when they become Active (meaning being ranked as at least Silver, Gold, or Diamond)',
                        style: TextStyle(color: kpurple, fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
