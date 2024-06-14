import 'package:e_commerce/common/widgets/email_verification_success.dart';
import 'package:e_commerce/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                  image: const AssetImage(TImages.deliveryEmailImage),
                  width: THelperFunction.screenWidth() * 0.6),
              const Gap(TSizes.spaceBetweenSections),
              Text(TTexts.confirmYourEmailHeading,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const Gap(TSizes.spaceBetweenSections),
              Text("support@example.com",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const Gap(TSizes.spaceBetweenSections),
              Text(TTexts.confirmYourEmailSubHeading,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const Gap(TSizes.spaceBetweenSections),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton (
                    onPressed: () => Get.to(
                      () => SuccessScreen (
                        image: TImages.emailVerificationSuccess,
                        title: TTexts.yourAccountCreatedTitle,
                        subTitle: TTexts.yourAccountCreatedTitleSubTitle,
                        onPressed: () => Get.offAll(() => const LoginScreen()),
                        
                      ),
                    ),
                    child: const Text(TTexts.continueMessage))),

              const Gap(TSizes.spaceBetweenSections),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child: const Text(TTexts.resendEmail))),
              const Gap(TSizes.spaceBetweenSections),
            ],
          ),
        ),
      ),
    );
  }
}
