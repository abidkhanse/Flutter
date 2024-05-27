import 'package:first_flutter_project/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

import '../utils/app_styles.dart';

class HotelScreen extends StatelessWidget {

  final Map<String, dynamic> hotel;
  const HotelScreen({super.key, required this.hotel}) ;

  @override
  Widget build(BuildContext context) {

    final size = AppLayout.getScreenSize(context);

    return Container (
      width: size.width * 0.6,
      height: AppLayout.getHeight(350, context),
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15, context), vertical: AppLayout.getHeight(17, context)),
      margin: EdgeInsets.only(right: AppLayout.getWidth(17, context), top: AppLayout.getWidth(5, context)),
      decoration: BoxDecoration (
        color: Styles.primaryColor,
        borderRadius: BorderRadius.circular(AppLayout.getWidth(24, context)),
      ),

      child: Column (

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: 180,
            decoration: BoxDecoration (
              borderRadius: BorderRadius.circular(AppLayout.getWidth(12, context)),
              color: Styles.primaryColor,
              image: DecorationImage (
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${hotel['image']}')
              )
            ),
          ),
          const Gap(15),
          Text(hotel['place'], style: Styles.headlineStyle2.copyWith(color: Colors.grey),),
          const Gap(5),
          Text(hotel['destination'], style: Styles.headlineStyle3.copyWith(color: Colors.white),),
          const Gap(8),
          Text("\$${hotel['price']}/night", style: Styles.headlineStyle1.copyWith(color: Colors.grey),)
        ],
      ),
    );
  }
}
