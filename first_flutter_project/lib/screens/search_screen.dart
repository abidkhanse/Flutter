import 'package:first_flutter_project/utils/app_layout.dart';
import 'package:first_flutter_project/widgets/app_icon.dart';
import 'package:first_flutter_project/widgets/double_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../utils/app_styles.dart';
import '../widgets/app_ticket_tab.dart';

class SearchScreen extends StatelessWidget {

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double width = AppLayout.getScreenWidth(context);
    double height = AppLayout.getScreenHeight(context);
    String smiley = '\u{1F600}';
    String smiley_heart = '\u{1F60D}';
    String smiley_hug = '\u{1F917}';

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getWidth(20, context),
          vertical: AppLayout.getHeight(20, context)
                
        ),

        children: [
          Gap(AppLayout.getHeight(40, context)),
          Text("What you \nare looking for", style: Styles.headlineStyle1.copyWith(fontSize: 35)),
          Gap(AppLayout.getHeight(20, context)),
          const AppTicketTab("Airline Tickets", "Hotel"),
          Gap(AppLayout.getHeight(25, context)),
          const AppTextIcon(icon: Icons.flight_takeoff_rounded, text: "Departure"),
          Gap(AppLayout.getHeight(15, context)),
          const AppTextIcon(icon: Icons.flight_land_rounded, text: "Arrival"),
          Gap(AppLayout.getHeight(15, context)),
          Container (
            padding: EdgeInsets.symmetric(
              vertical: AppLayout.getWidth(15, context), horizontal: AppLayout.getWidth(15, context)
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(25, 67, 194, 10),
              borderRadius: BorderRadius.circular(AppLayout.getWidth(10, context)),
            ),
            child: Center(child: Text("Find Tickets",style: Styles.textStyle.copyWith(color: Colors.white))),
          ),
          Gap(AppLayout.getHeight(25, context)),
          DoubleTextWidget("Upcoming Flights", "View all"),
          Gap(AppLayout.getHeight(20, context)),
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container (
                height: AppLayout.getWidth(425, context),
                width: width * 0.42,
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15, context), vertical: AppLayout.getWidth(15, context)),
                decoration: BoxDecoration (
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppLayout.getWidth(20, context)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 1,
                      spreadRadius: 1
                    )
                  ]
                ),
                child: Column (
                  children: [
                    Container(
                      height: AppLayout.getWidth(190, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getHeight(12, context)),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/delivery.gif")
                        )
                      ),
                    ),
                    Text("20% discount on the early booking, Don't miss out this chance", style: Styles.headlineStyle2,)
                  ],
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container (
                        width: width * 0.44,
                        height: AppLayout.getHeight(200, context),
                        decoration: BoxDecoration (
                            color: const Color(0xFF2EA4A5),
                            borderRadius: BorderRadius.circular(AppLayout.getHeight(18, context))
                        ),
                        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20, context), vertical: AppLayout.getHeight(20, context)),
                        child: Column(
                          children: [
                            Text("Discount for Survey", style: Styles.headlineStyle2.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                            Gap(AppLayout.getHeight(10, context)),
                            Text("Take the survey about our service and get discount ", style: Styles.headlineStyle3.copyWith(fontWeight: FontWeight.w500, color: Colors.white)),
                          ],
                        ),
                      ),
                      Positioned (
                        right: -45,
                        top: -40,
                        child: Container(
                        padding: EdgeInsets.all(AppLayout.getHeight(30, context)),
                        decoration: BoxDecoration (
                            shape: BoxShape.circle,
                            border: Border.all(width: 18, color: const Color(0XFF168F8F)),
                            color: Colors.transparent
                        ),
                      )
                      )
                    ],
                  ),
                  Gap(AppLayout.getHeight(15, context)),
                  Container (
                    width: width * 0.44,
                    height: AppLayout.getHeight(210, context),
                    padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15, context), horizontal: AppLayout.getHeight(15, context)) ,
                    decoration: BoxDecoration (
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(18, context)),
                      color: const Color(0xffec6545)
                    ),
                    child: Column(
                      children: [
                        Text("Take love", style: Styles.headlineStyle2.copyWith(color: Colors.white, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
                        Gap(AppLayout.getHeight(15, context)),
                        RichText(text: TextSpan(
                          children: [
                            TextSpan (
                              text: smiley,
                              style: TextStyle(fontSize: 38),
                            ),
                            TextSpan (
                              text: smiley_hug,
                              style: TextStyle(fontSize: 50),
                            ),
                            TextSpan (
                              text: smiley_heart,
                              style: TextStyle(fontSize: 38),
                            ),

                          ]
                        ))
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}









