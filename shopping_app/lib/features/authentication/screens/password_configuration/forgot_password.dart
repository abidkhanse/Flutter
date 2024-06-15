import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'reset_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            /// Headings
            Text(TTexts.forgotPassword, style: Theme.of(context).textTheme.headlineMedium),
            const Gap(TSizes.spaceBtwItems),
            
            /// Text message
            Text(TTexts.forgotPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium),
            const Gap(TSizes.spaceBetweenSections * 2),
            
            /// Submit form
            TextFormField (decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct_right))),
            const Gap(TSizes.spaceBetweenSections),

            /// Submit button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()), child: const Text(TTexts.submit))),
            
          ],
        ),)
    );
  }
}