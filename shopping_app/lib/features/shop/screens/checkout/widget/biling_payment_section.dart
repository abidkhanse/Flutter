import 'package:e_commerce/common/widgets/rounded_container.dart';
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {

    final isDark = THelperFunction.isDarkMode(context);

    return Column (
      children: [
        SeactionHeading(title: 'Payment Method', textColor: TColors.black, buttonTitle: 'Change', onPressed: (){}),
        const Gap(TSizes.spaceBtwItems/2),
        Row (
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: isDark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(image: AssetImage(TImages.payPal), fit: BoxFit.contain,),
            ),
            const Gap(TSizes.spaceBtwItems/2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],

    );
  }
}






