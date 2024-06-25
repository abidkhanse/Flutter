import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/common/widgets/icons/circular_Icon.dart';
import 'package:e_commerce/common/widgets/layout/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold (

      appBar: ApplicationBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () { })
        ],
      ),
      body : SingleChildScrollView(
        child: Padding (
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column (
            children: [
              GridLayout(itemCount: 6, itemBuilder: (_, index) => const ProductCardVertical())
            ]
          ),
        )
      )
    );
  }
}
