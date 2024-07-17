
import 'package:e_commerce/common/widgets/section_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TBillingAddressSection extends StatelessWidget {
  
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Column (

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        SeactionHeading(title: 'Shipping Address', buttonTitle: 'Change', textColor: TColors.black, onPressed: (){}),
        
        Text('Coding with Abid', style: Theme.of(context).textTheme.bodyLarge),
        
        const Gap(TSizes.spaceBtwItems/2),

        Row(
          children: [
            const Icon(Icons.phone, color: TColors.grey, size: 16),
            const Gap(TSizes.spaceBtwItems/2),
            Text('(123) 456-7890', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        const Gap(TSizes.spaceBtwItems),

        Row(
          children: [
            const Icon(Icons.location_history, color: TColors.grey, size: 16),
            const Gap(TSizes.spaceBtwItems/2),
            Text('South Carolina, USA', style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          ],
        ),
      ],
    );
  }
}