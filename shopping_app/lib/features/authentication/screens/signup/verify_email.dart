import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/screens/signup/verify_email_controller.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
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
              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const Gap(TSizes.spaceBetweenSections),
              Text(TTexts.confirmYourEmailSubHeading,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const Gap(TSizes.spaceBetweenSections),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>
                          controller.checkEmailVerificationStatus(),
                      child: const Text(TTexts.continueMessage))),
              const Gap(TSizes.spaceBetweenSections),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification(),
                      child: const Text(TTexts.resendEmail))),
              const Gap(TSizes.spaceBetweenSections),
            ],
          ),
        ),
      ),
    );
  }
}
