import 'package:e_commerce/common/widgets/appbar/application_bar.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widgets/over_all_product_rating.dart';
import 'widgets/rating_bar_indicator.dart';
import 'widgets/user_review_card.dart';

class TProductReviews extends StatelessWidget {
  const TProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      
      appBar: ApplicationBar(title: Text('Reviews and Rating'), showBackArrorw: true,),

      body: SingleChildScrollView (
        child: Padding (
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Ratings and reviews are verified and are from people who use the same type of produc'),
              Gap(TSizes.spaceBtwItems),
              OverallProductRating(),
              
              TRatingBarIndicator(rating: 3.5),
              Text('12,123', style: Theme.of(context).textTheme.bodySmall),
              const Gap(TSizes.spaceBetweenSections),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),

            ]
          ),
        ),
      ),
    );
  }
}


