import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchContainer extends StatelessWidget {
  
  const SearchContainer ({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTapp,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),

    }
  );

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTapp;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);

    return GestureDetector (
      onTap: onTapp,
      child: Padding (
        padding: padding,
        child: Container (
          width: TDeviceUtility.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration (
            color: showBackground
                ? isDark
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: TColors.grey) : null,
          ),
          child: Row (
            children: [
              Icon(icon, color: TColors.darkGrey),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
