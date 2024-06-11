
import 'package:e_commerce/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final onBoardingController = OnBoardingController.instance;

    final isDarkMode = THelperFunction.isDarkMode(context);
    return Positioned (
        bottom: TDeviceUtility.getBottomNavigationBarHeight() + 25,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator (

            controller: onBoardingController.pageController,
            count: 3,
            onDotClicked: onBoardingController.dotNavigationClick,


            effect: ExpandingDotsEffect(activeDotColor: isDarkMode ? TColors.white : TColors.dark, dotHeight: 10)
        )
    );
  }
}
