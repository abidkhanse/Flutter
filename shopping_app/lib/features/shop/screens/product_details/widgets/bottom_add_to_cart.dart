import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCart extends StatelessWidget {

  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {

    final isDark = THelperFunction.isDarkMode(context);

    return Container (

      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),

      decoration: BoxDecoration (
        color: isDark? TColors.black : TColors.white,
        borderRadius: const BorderRadius.only (
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg)
        )
      ),
      
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon ( 
                icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
              const Gap(TSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall,),
              const Gap(TSizes.spaceBtwItems),
              const TCircularIcon ( 
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black)
            ),
            child: const Text('Add to Cart'),
          )
        ],
      ),  
    );
  }
}