
import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
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
    return Form(
        child: Column(
          children: [
            Row(
              children: [
                Expanded (
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user))
                  ),
                ),
    
                const Gap(TSizes.spaceBtwInputFields),
    
                Expanded (
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user))
                  ),
                ),
              ],
            ),
    
            const Gap(TSizes.spaceBtwInputFields),
    
            TextFormField (
              expands: false,
              decoration: const InputDecoration(labelText: TTexts.userName, prefixIcon: Icon(Iconsax.edit))
            ),
    
            const Gap(TSizes.spaceBtwInputFields),
            
            TextFormField (
              expands: false,
              decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct))
            ),
            
            const Gap(TSizes.spaceBtwInputFields),
            
            TextFormField (
              expands: false,
              decoration: const InputDecoration(labelText: TTexts.phoneNumber, prefixIcon: Icon(Iconsax.call))
            ),
            
            const Gap(TSizes.spaceBtwInputFields),
            
            TextFormField (
              expands: false,
              decoration: const InputDecoration(labelText: TTexts.password, prefixIcon: Icon(Iconsax.password_check), suffixIcon: Icon(Iconsax.eye_slash))
            ),
            const Gap(TSizes.spaceBtwInputFields),
    
            Row(
              children: [
                SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value) {})),
                const Gap(TSizes.spaceBtwInputFields),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan( text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan( text: TTexts.privacyPolicy, style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primaryColor,
                      )),
    
    
                      TextSpan( text: ' ${TTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan( text: TTexts.termsOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? TColors.white : TColors.primaryColor,
                      )),
                    ],
                  ),
                )
              ],
            ),
    
            const Gap(TSizes.spaceBtwInputFields),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const VerifyEmail()) , child: const Text(TTexts.createAccount))),
    
          ],
        ),
      );
  }
}
