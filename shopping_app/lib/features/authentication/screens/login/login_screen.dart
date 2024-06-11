import 'package:e_commerce/common/styles/spacing_style.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: SpacingStyle.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image (height: 150, image: AssetImage (isDark ? TImages.lightAppLogo : TImages.darkAppLogo)),
                Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: TSizes.sm),
                Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBetweenSections),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: TTexts.email),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),

                    TextFormField (
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: TTexts.password,
                          suffixIcon: Icon(Iconsax.eye_slash)),
                    ),

                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Text(TTexts.rememberMe),
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(TTexts.forgotPassword)),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(TTexts.signIn))),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: const Text(TTexts.createAccount))),

                    const SizedBox(height: TSizes.spaceBtwInputFields),
                  ],
                ),
              ),
            ),

            Row (
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Flexible(child: Divider(color: isDark ? TColors.darkerGrey : TColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
                Text(TTexts.orSignInWith.capitalize!, style: Theme.of(context).textTheme.labelMedium),
                Flexible(child: Divider(color: isDark ? TColors.darkerGrey : TColors.grey, thickness: 0.5, indent: 5, endIndent: 60))
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            Row (
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(width: TSizes.iconMd, height: TSizes.iconMd, image: AssetImage(TImages.google)),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(width: TSizes.iconMd, height: TSizes.iconMd, image: AssetImage(TImages.facebook)),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
