import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row (
          children: [
            
            const Icon(Iconsax.star5, color: TColors.secondary, size: 24),

            const SizedBox(width: TSizes.spaceBtwItems / 2),

            Text.rich (
              TextSpan (
                children: [
                  TextSpan ( text: '4.5', style: Theme.of(context).textTheme.bodyMedium),
                  const TextSpan(text: '(199)')
                ]
              ),
            )
          ],
        ),

        IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: TSizes.iconMd))

      ],
    );
  }
}
