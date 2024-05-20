import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/products/ratings/rating_indicator.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(SImages.userProfileImage1)),
                const SizedBox(width: SSizes.spaceBtwItems),
                Text(
                  'User Name',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems),
        //Review
        Row(
          children: [
            const SRatingBarIndicator(rating: 4),
            const SizedBox(width: SSizes.spaceBtwItems),
            Text('25 Nov 2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems),
        const ReadMoreText(
          'User review for more information on the user and their feedback for the user and their feedback for the user and their feedback for the user and their feedback for the user and their feedback for the user and their feedback for the user and other user and',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SColors.primary),
        ),
        const SizedBox(height: SSizes.spaceBtwItems),

        //Company Review
        SRoundedContainer(
          backgroundColor: dark ? SColors.darkerGrey : SColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(SSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Some Store',
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text('26 Nov 2024',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: SSizes.spaceBtwItems),
                const ReadMoreText(
                  'User review for more information on the user and their feedback for the user and their feedback for the user and their feedback for the user and their feedback for the user and their feedback for the user and their feedback for the user and other user and',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: SColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: SColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: SSizes.spaceBtwSections),
      ],
    );
  }
}
