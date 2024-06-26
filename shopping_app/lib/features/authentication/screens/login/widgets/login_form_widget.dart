import 'package:e_commerce/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:e_commerce/navigation_bar.dart';
import 'package:e_commerce/test_widgets/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
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
                    onPressed: () => Get.to(() => const ForgotPassword()), child: const Text(TTexts.forgotPassword)),
              ],
            ),
            
            const SizedBox(height: TSizes.spaceBtwInputFields),
            
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() =>  const ApplicationNavigationBar() ),
                    child: const Text(TTexts.signIn))),
            
            const SizedBox(height: TSizes.spaceBtwItems),
            
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    //onPressed: () => Get.to(() => const SignupScreen() ), 
                    onPressed: () => Get.to(() => const GifDemo() ), 
                    child: const Text(TTexts.createAccount))),

            const SizedBox(height: TSizes.spaceBtwInputFields),
          ],
        ),
      ),
    );
  }
}
