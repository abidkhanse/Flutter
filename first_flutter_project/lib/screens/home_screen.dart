import 'package:first_flutter_project/screens/hotel_screen.dart';
import 'package:first_flutter_project/screens/ticket_view.dart';
import 'package:first_flutter_project/utils/app_info_list.dart';
import 'package:first_flutter_project/utils/app_layout.dart';
import 'package:first_flutter_project/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../widgets/double_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Styles.bgColor,
      body: ListView (
        children: [

          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20, context)),
            child: Column(
              children: [
                const Gap(40),
                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Good Morning", style: Styles.headlineStyle3),
                      const Gap(5),
                      Text("Book Tickets", style: Styles.headlineStyle1,)
                      ],
                    ),

                    Container(
                      width: AppLayout.getWidth(50, context),
                      height: AppLayout.getHeight(50, context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getWidth(5, context)),
                        image: const DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/member.png"
                          )
                        )
                      ),
                    )
                  ],
                ),
                const Gap(25),
                Container (
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppLayout.getWidth(10, context)),
                    color: const Color(0xFFF4F6FD)
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppLayout.getWidth(12, context),
                      vertical: AppLayout.getWidth(12, context)),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Color(0xFFBFC205)),
                      Text("Search", style: Styles.headlineStyle4),
                    ],
                  ),
                ),
                const Gap(40)
                , DoubleTextWidget("Upcoming Flights", "View all")
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(

            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: AppLayout.getWidth(20, context)),

            child: Row (
              children: ticketList.map((e) => TicketView(ticket: e)).toList(),
            ),

          ),


          const Gap(15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20, context)),
            child: DoubleTextWidget("Hotels", "View all")
          ),
          const Gap(15),
          SingleChildScrollView (
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: AppLayout.getWidth(20, context)),
            child: Row (
              // here is problem
              children: hotelList.map((e) => HotelScreen(hotel: e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
