import 'package:first_flutter_project/utils/app_layout.dart';
import 'package:first_flutter_project/widgets/column_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';

import '../utils/app_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (

      backgroundColor: Styles.bgColor,

      body: ListView (
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20, context), vertical: AppLayout.getHeight(20, context)),
        children: [
          Gap(AppLayout.getHeight(40, context)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container (
                height: AppLayout.getWidth(86, context),
                width: AppLayout.getWidth(86, context),
                decoration: BoxDecoration (
                  borderRadius: BorderRadius.circular(AppLayout.getWidth(10, context)),
                  image: const DecorationImage (
                    image: AssetImage ( "assets/images/member.png") )
                )
              ),
              Gap(AppLayout.getHeight(15, context)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Book Ticket", style: Styles.headlineStyle1,),
                  Gap(AppLayout.getHeight(2, context)),
                  Text("New-York", style: Styles.headlineStyle4,),
                  Gap(AppLayout.getHeight(8, context)),
                  Container ( 
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(100, context)),
                      color: const Color(0xFFFEF4f3)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(3, context), vertical: AppLayout.getHeight(3, context)),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF526799)
                          ),
                          child: const Icon(Icons.shield_rounded, color: Colors.white, size: 20)
                        ),
                        Gap(AppLayout.getHeight(5, context)),
                        const Text("Premium status", style: TextStyle(color: Color(0xFF526799)))
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      print("you are tapped");
                    },
                    child: Text(
                      "Edit",
                      style: Styles.textStyle.copyWith(color: Styles.primaryColor, fontWeight: FontWeight.w300),
                    ),
                  )
                ],
              )

            ],
          ),
          Gap(AppLayout.getHeight(8, context)),
          Divider(color: Colors.grey.shade300),
          Stack(
            children: [
              Container(
                height: AppLayout.getHeight(90, context),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Styles.primaryColor,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(18, context))
                ),
              ),
              Positioned(
                right: -45,
                top: -40,
                  child: Container (
                    padding: EdgeInsets.all(AppLayout.getHeight(30, context)),
                    decoration: BoxDecoration (
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(width: 18, color: const Color(0xFF264CD2))
                  ),
                )
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20, context), vertical: AppLayout.getHeight(20, context)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar (
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.lightbulb, color: Styles.primaryColor, size: 27),
                    ),
                    Gap(AppLayout.getHeight(12, context)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You have got a new award", style: Styles.headlineStyle2.copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
                        Text("You have 95 flights in a year.", style: Styles.headlineStyle3.copyWith(fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.9)))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Gap(AppLayout.getHeight(20, context)),
          Text("Accumulated miles", style: Styles.headlineStyle1,),
          Gap(AppLayout.getHeight(30, context)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15, context)),
            child: Column (
              children: [
                Text("192802", style: TextStyle(fontSize: 45, color: Styles.textColor, fontWeight: FontWeight.w600),
                ),
                Gap(AppLayout.getHeight(40, context)),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Miles accrued", style: Styles.headlineStyle4.copyWith(fontSize: 16),),
                    Text("11 June 2022", style: Styles.headlineStyle4.copyWith(fontSize: 16),)
                  ],
                ),
                Gap(AppLayout.getHeight(20, context)),
                const Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColumnRow("23.042", "Miles", CrossAxisAlignment.start),
                    ColumnRow("Airline CO", "Received from", CrossAxisAlignment.end)
                  ],
                ),
                Gap(AppLayout.getHeight(10, context)),
                Divider(color: Colors.grey.shade300),
                Gap(AppLayout.getHeight(20, context)),
                const Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColumnRow("24", "Miles", CrossAxisAlignment.start),
                    ColumnRow("McDonal's", "Received from", CrossAxisAlignment.end)
                  ],
                ),
                Gap(AppLayout.getHeight(10, context)),
                Divider(color: Colors.grey.shade300),
                Gap(AppLayout.getHeight(20, context)),
                const Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ColumnRow("52 340", "Miles", CrossAxisAlignment.start),
                    ColumnRow("DBest tech", "Received from", CrossAxisAlignment.end)
                  ],
                ),
                Gap(AppLayout.getHeight(20, context)),

              ],
            ),
          ),
          Gap(AppLayout.getHeight(10, context)),
          Center(
            child: Text(
              "How to get more widgets",
              style: Styles.textStyle.copyWith(color: Styles.primaryColor, fontWeight: FontWeight.w500, ),
            ),
          )
        ],
      ),
    );
  }
}
