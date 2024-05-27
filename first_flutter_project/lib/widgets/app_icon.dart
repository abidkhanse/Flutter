import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class AppTextIcon extends StatelessWidget {

  final IconData icon;
  final String text;

  const AppTextIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container (

      padding: EdgeInsets.symmetric(vertical: AppLayout.getWidth(12, context), horizontal: AppLayout.getHeight(12, context)),
      decoration: BoxDecoration (
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppLayout.getWidth(10, context))
      ),
      child: Row (
        children: [
          Icon(icon, color: Colors.grey,),
          Gap(AppLayout.getWidth(10, context)),
          Text(text, style: Styles.textStyle,)
        ],
      ),
    )
    ;
  }
}
