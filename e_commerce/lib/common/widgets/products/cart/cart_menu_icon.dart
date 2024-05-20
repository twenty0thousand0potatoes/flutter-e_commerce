import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/features/shop/screens/cart/cart.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class SCartCounterIcon extends StatelessWidget {
  const SCartCounterIcon({
    super.key,
    this.iconColor = SColors.white,
    required this.onPressed,
  });

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: dark ? SColors.white : SColors.black,
          ),
        ),
        // Positioned(
        //   right: 0,
        //   child: Container(
        //     width: 18,
        //     height: 18,
        //     decoration: BoxDecoration(
        //       color: dark ? SColors.white : SColors.black,
        //       borderRadius: BorderRadius.circular(100),
        //     ),
        //     child: Center(
        //       child: Text(
        //         '2',
        //         style: Theme.of(context).textTheme.labelLarge!.apply(
        //             color: dark ? SColors.black : SColors.white,
        //             fontSizeFactor: 0.9),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
