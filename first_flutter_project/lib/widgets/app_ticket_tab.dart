import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../utils/app_layout.dart';

class AppTicketTab extends StatelessWidget {

  final String firstTabText;
  final String secondTabText;

  const AppTicketTab(this.firstTabText, this.secondTabText, {super.key});

  @override
  Widget build(BuildContext context) {

    double width = AppLayout.getScreenWidth(context);
    AppLayout.getScreenHeight(context);

    return FittedBox(
        child: Container (
            padding: const EdgeInsets.all(3.5),
            child: Row (
              children: [
                Container(
                    width: width * 0.44,
                    padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7, context)),
                    decoration: BoxDecoration (
                      color: Colors.white,
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(AppLayout.getHeight(50, context))),
                    ),
                    child: Center(child: Text(firstTabText),)
                ),
                const Gap(5),
                Container(
                    width: width * 0.44,
                    padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7, context)),
                    decoration: BoxDecoration (
                      color: CupertinoColors.lightBackgroundGray,
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(AppLayout.getHeight(50, context))),
                    ),
                    child: Center(child: Text(secondTabText))
                )
              ],
            )
        )
    );
  }
}
