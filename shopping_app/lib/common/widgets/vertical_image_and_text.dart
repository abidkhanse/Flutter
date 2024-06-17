
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VerticalImageAndText extends StatelessWidget {
  const VerticalImageAndText(
      {super.key,
      required this.image,
      required this.title,
      required this.textColor,
      this.backgroundColor,
      this.onTapp});

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTapp;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: onTapp,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (isDark ? TColors.black : TColors.white),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Center(child: Image(image: AssetImage(image), fit: BoxFit.cover, color: isDark ? TColors.light : TColors.dark))
            ),
            const Gap(TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            )
          ],
        ),
      ),
    );
  }
}
