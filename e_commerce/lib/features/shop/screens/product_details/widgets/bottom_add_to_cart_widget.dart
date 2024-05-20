import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/common/widgets/icons/s_circular_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/wishlist.dart';

class SBottomAddToCard extends StatelessWidget {

  const SBottomAddToCard({super.key, required this.productId});

   final String productId;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: SSizes.defaultSpace, vertical: SSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? SColors.darkerGrey : SColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(SSizes.cardRadiusLg),
          topRight: Radius.circular(SSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Row(
          //   children: [
          //     const SCircularIcon(
          //         icon: Iconsax.minus,
          //         backgroundColor: SColors.darkGrey,
          //         width: 40,
          //         height: 40,
          //         color: SColors.white),
          //     const SizedBox(width: SSizes.spaceBtwItems),
          //     Text('2', style: Theme.of(context).textTheme.titleSmall),
          //     const SizedBox(width: SSizes.spaceBtwItems),
          //     const SCircularIcon(
          //         icon: Iconsax.add,
          //         backgroundColor: SColors.black,
          //         width: 40,
          //         height: 40,
          //         color: SColors.white),
          //   ],
          // ),
          ElevatedButton(
            onPressed: () {
              if (Wishlist.containsProduct(productId)) {
                Wishlist.removeProduct(productId);
              } else {
                Wishlist.addProduct(productId);
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(SSizes.md),
              backgroundColor: SColors.black,
              side: const BorderSide(color: SColors.black),
            ),
            child: const Text('Add to Cart'),
          )
        ],
      ),
    );
  }
}
