import 'package:e_commerce/common/styles/spacing_style.dart';
import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: SpacingStyle.paddingWithAppBarHeight * 2,
      child: Column(
        children: [
          Image(
              image: AssetImage(image),
              width: THelperFunction.screenWidth() * 6),
          const Gap(TSizes.spaceBetweenSections),
          Text(title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center),
          const Gap(TSizes.spaceBetweenSections),
          Text(subTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center),
          const Gap(TSizes.spaceBetweenSections),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(TTexts.continueMessage))),
        ],
      ),
    )));
  }
}
