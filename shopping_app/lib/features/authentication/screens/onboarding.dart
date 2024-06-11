import 'package:e_commerce/features/authentication/screens/onboarding/widgets/on_boarding_arrow.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../controllers/onboarding/onboarding_controller.dart';
import 'onboarding/widgets/on_boarding_dots.dart';
import 'onboarding/widgets/on_boarding_page.dart';
import 'onboarding/widgets/on_boarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final onBoardingController = Get.put(OnBoardingController());

    return Scaffold (
      body: Stack(
        children: [
          PageView(
            controller: onBoardingController.pageController,
            onPageChanged: onBoardingController.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image: TImages.onBoardingDelivery,
                  title: TTexts.onBoardingTitle1,
                  subTitle: TTexts.onBoardingSubTitle1
              ),
              OnBoardingPage(
                  image: TImages.onBoardingOrder,
                  title: TTexts.onBoardingTitle2,
                  subTitle: TTexts.onBoardingSubTitle2
              ),
              OnBoardingPage(
                  image: TImages.onBoardingSearch,
                  title: TTexts.onBoardingTitle3,
                  subTitle: TTexts.onBoardingSubTitle3
              )
            ],
          ),
          OnBoardingSkip(topSpace: TDeviceUtility.getAppBarHeight(), rightSpace: TSizes.defaultSpace),
          const OnBoardingDotNavigation(),
          const OnBoardingArrow()

        ],
      ),
    );
  }
}





