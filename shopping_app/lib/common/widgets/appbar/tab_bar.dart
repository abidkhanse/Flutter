import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TTabBar extends StatelessWidget  implements PreferredSizeWidget { 
  
  const TTabBar({super.key, required this.tabs});
  final List<Widget> tabs;  

  @override
  Widget build(BuildContext context) {

    bool isDark = THelperFunction.isDarkMode(context);

    return Material (
      
      color: isDark ? TColors.black : TColors.white,
      child: TabBar (
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: isDark ? TColors.white : TColors.primary,
        unselectedLabelColor: TColors.darkGrey
      ),
    );
  }
  
  @override 
  Size get preferredSize => Size.fromHeight(TDeviceUtility.getAppBarHeight());

}