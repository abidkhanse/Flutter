import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/order_list_items.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      
      appBar: ApplicationBar (showBackArrorw: true, title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding ( 
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: OrderListItems(),
      )
    );
  }
}