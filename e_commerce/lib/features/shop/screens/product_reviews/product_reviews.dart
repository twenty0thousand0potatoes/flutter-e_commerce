import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/ratings/rating_indicator.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: const SAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Reviews & Ratings'),
            const SizedBox(height: SSizes.spaceBtwItems),
            //Overall Product Ratings
            const SOverallProductRating(),
            const SRatingBarIndicator(rating: 4.4),
            Text('12,123', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: SSizes.spaceBtwSections),
            //User Review List
            const UserReviewCard(),
          ]),
        ),
      ),
    );
  }
}
