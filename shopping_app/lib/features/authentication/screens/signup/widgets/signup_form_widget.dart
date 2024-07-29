import 'package:e_commerce/features/authentication/screens/signup/signup_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(children: [
            Expanded(
              child: TextFormField(
                  controller: controller.firstNameController,
                  validator: (value) =>
                      TValidator.validateEmptyText('first name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user))),
            ),
            const Gap(TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                  controller: controller.lastNameController,
                  validator: (value) =>
                      TValidator.validateEmptyText('last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastName,
                      prefixIcon: Icon(Iconsax.user))),
            )
          ]),
          const Gap(TSizes.spaceBtwInputFields),
          TextFormField(
              controller: controller.userNameController,
              validator: (value) =>
                  TValidator.validateEmptyText('username', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.userName, prefixIcon: Icon(Iconsax.edit))),
          const Gap(TSizes.spaceBtwInputFields),
          TextFormField(
              controller: controller.emailController,
              validator: (value) => TValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct))),
          const Gap(TSizes.spaceBtwInputFields),
          TextFormField(
              controller: controller.phoneNumberController,
              validator: (value) => TValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNumber,
                  prefixIcon: Icon(Iconsax.call))),
          const Gap(TSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                controller: controller.passwordController,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ))),
          ),
          const Gap(TSizes.spaceBtwInputFields),
          Row(
            children: [
              SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(() => Checkbox(
                      value: controller.privacyPolicy.value,
                      onChanged: (value) => controller.privacyPolicy.value =
                          !controller.privacyPolicy.value))),
              const Gap(TSizes.spaceBtwInputFields),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${TTexts.iAgreeTo} ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: TTexts.privacyPolicy,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: dark ? TColors.white : TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? TColors.white : TColors.primary,
                            )),
                    TextSpan(
                        text: ' ${TTexts.and} ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: TTexts.termsOfUse,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: dark ? TColors.white : TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? TColors.white : TColors.primary,
                            )),
                  ],
                ),
              )
            ],
          ),
          const Gap(TSizes.spaceBtwInputFields),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(TTexts.createAccount))),
        ],
      ),
    );
  }
}
