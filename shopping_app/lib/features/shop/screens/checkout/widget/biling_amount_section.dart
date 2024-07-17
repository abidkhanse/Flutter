
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Sub Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('256.0', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const Gap(TSizes.spaceBtwItems/2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shiping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('6.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const Gap(TSizes.spaceBtwItems/2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('2.0', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const Gap(TSizes.spaceBtwItems/2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('264.0', style: Theme.of(context).textTheme.titleMedium),
          ],
        )
      ],
    );
  }
}