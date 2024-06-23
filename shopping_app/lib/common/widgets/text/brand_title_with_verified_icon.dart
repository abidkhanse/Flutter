import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import 'brand_title_text.dart';

class BrandTitleWithVerifiedIcon extends StatelessWidget {
  const BrandTitleWithVerifiedIcon ( {
      super.key, 
      this.textColor, 
      required this.title, 
      this.maxLines = 1, 
      this.iconColor = TColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSizes = TextSizes.small,
    }
  );

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row (
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            maxLines: maxLines,
            color: textColor,
            textAlign: textAlign,
            brandTextSize: brandTextSizes,
          )  
          
        ),
        const Gap(TSizes.xs),
        const Icon(Iconsax.verify5, size: TSizes.iconXs, color: TColors.primary)
      ],
    );
  }
}
