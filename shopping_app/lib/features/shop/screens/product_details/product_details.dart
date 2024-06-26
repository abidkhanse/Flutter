import 'package:flutter/material.dart';

import 'widgets/product_image_with_slider.dart';
import 'widgets/rating_and_share.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return const Scaffold (
      
      body: SingleChildScrollView (

        child: Column (

          children: [
            /// 1 Product Image Slider
            ProductImageWithSlider(),

            RatingAndShare(),


            
            
            /// 2 Product Details
             
          ],
        )
      ),
    );
  }
}
