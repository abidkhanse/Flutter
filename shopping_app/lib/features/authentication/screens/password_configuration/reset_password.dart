import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton (
            onPressed: () => Get.back(),
            icon: const Icon( CupertinoIcons.clear ),
          ),
        ],
      ),
      
      body: SingleChildScrollView (
        
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              Image(image: const AssetImage(TImages.emailSentColored), width: THelperFunction.screenWidth() * 0.6 ),
             
              /// Title 
              Text( TTexts.passwordResetEmailSent , style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const Gap(TSizes.spaceBtwItems),

              /// SubTitle
              Text(TTexts.passwordResetEmailSentSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const Gap(TSizes.spaceBtwItems),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: const Text(TTexts.done)),
              ),
              const Gap(TSizes.spaceBtwItems),
              
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () {}, child: const Text(TTexts.resendEmail)),
              ),
              const Gap(TSizes.spaceBtwItems),

            ],
          ), 
        ),
      ),
    );
  }
}