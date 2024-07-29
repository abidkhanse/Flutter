import 'package:e_commerce/common/widgets/divider_widget.dart';
import 'package:e_commerce/common/widgets/social_media_widget.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'widgets/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    THelperFunction.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    Text(TTexts.signupTitle,
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: TSizes.defaultSpace),
                    const SignUpFormWidget(),
                    const Gap(TSizes.spaceBtwInputFields),
                    DividerWidget(text: TTexts.orSignInWith.capitalize!),
                    const Gap(TSizes.spaceBtwInputFields),
                    const SocialMediaWidget()
                  ],
                ))));
  }
}
