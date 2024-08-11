import 'package:e_commerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Headings
              Text(TTexts.forgotPassword,
                  style: Theme.of(context).textTheme.headlineMedium),
              const Gap(TSizes.spaceBtwItems),

              /// Text message
              Text(TTexts.forgotPasswordSubtitle,
                  style: Theme.of(context).textTheme.labelMedium),
              const Gap(TSizes.spaceBetweenSections * 2),

              /// Submit form
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                    controller: controller.email,
                    validator: TValidator.validateEmail,
                    decoration: const InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right))),
              ),

              const Gap(TSizes.spaceBetweenSections),

              /// Submit button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.sendPasswordToResetEmail(),
                      child: const Text(TTexts.submit))),
            ],
          ),
        ));
  }
}
