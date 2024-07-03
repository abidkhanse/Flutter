import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_item.dart';
import 'package:e_commerce/common/widgets/products/cart/product_quantity_with_add_remove_button.dart';
import 'package:e_commerce/common/widgets/text/product_price_text.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar (
        showBackArrorw: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding (
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated (
          shrinkWrap: true,              
          itemCount: 10,
          separatorBuilder: (_,__) => const Gap(TSizes.spaceBetweenSections),
          itemBuilder: (_, index) => const Column (
            children: [
      
              CartItem(),    
              Gap(TSizes.spaceBtwItems),
              Row (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row (
                    children: [
                      SizedBox(width: 70),
                      TProductQuantityWithAddRemoveButton()      
                    ],
                  ),
                  ProductPriceText(price: '234')
               ]
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: const Text('Checkout \$234')),
      ),
    
    );
  }
}
