import 'package:e_commerce/common/widgets/products/cart/cart_item.dart';
import 'package:e_commerce/common/widgets/products/cart/product_quantity_with_add_remove_button.dart';
import 'package:e_commerce/common/widgets/text/product_price_text.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key, this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated (
      shrinkWrap: true,              
      itemCount: 2,
      separatorBuilder: (_,__) => const Gap(TSizes.spaceBetweenSections),
      itemBuilder: (_, index) => Column (
        children: [
          
          const CartItem(),    
          if(showAddRemoveButton) const Gap(TSizes.spaceBtwItems),

          if(showAddRemoveButton)
          const Row (
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
    );
  }
}
