import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../layout/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            onChanged: (value) {},
            items: const [
              'Name',
              'Higher Price',
              'Low Price',
              'Sales',
              'Newest',
              'Popularity'
            ]
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList()),
        const Gap(TSizes.spaceBetweenSections),
        GridLayout(
            itemCount: 8,
            itemBuilder: (_, index) => const ProductCardVertical())
      ],
    );
  }
}
