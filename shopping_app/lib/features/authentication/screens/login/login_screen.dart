import 'package:e_commerce/common/styles/spacing_style.dart';
import 'package:e_commerce/common/widgets/social_media_widget.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_form_widget.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/divider_widget.dart';
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
            const LoginFormWidget(),

            const DividerWidget(text: TTexts.orSignInWith),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            const SocialMediaWidget()
          ],
        ),
      )),
    );
  }
}
