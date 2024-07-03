import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    
    final isDark = THelperFunction.isDarkMode(context);

    return Row (
      mainAxisSize: MainAxisSize.min,
    
      children: [

        TCircularIcon (
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: isDark ? TColors.white : TColors.black,
          backgroundColor: isDark ? TColors.darkGrey : TColors.light,
        ),
        
        const Gap(TSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const Gap(TSizes.spaceBtwItems),
        
        const TCircularIcon (
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
