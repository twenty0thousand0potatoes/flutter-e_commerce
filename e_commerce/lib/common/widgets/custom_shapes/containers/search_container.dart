import 'package:e_commerce/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/screens/store/store.dart';

class SSearchContainer extends StatelessWidget {
  const SSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
    this.controller,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    final controller = Get.put(ProductController());

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: SDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(SSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? SColors.dark
                    : SColors.light
                : Colors.transparent,
            border: showBorder ? Border.all(color: SColors.grey) : null,
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(icon, color: SColors.darkerGrey),
                onPressed: () {
                  for (var element in controller.featuredProducts) {
                    if (element.description!.contains(Wishlist.searchLine) && Wishlist.searchLine != '') {
                      Wishlist.addProductSearch(element.id);
                    }
                  }
                  if(Wishlist.searchLine == ''){
                    Wishlist.searchList.clear();
                  }
                  Get.to(() => StoreScreen());
                },
              ),
              const SizedBox(width: SSizes.spaceBtwItems),
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration:
                      InputDecoration(hintText: text, border: InputBorder.none),
                  onChanged: (value) {
                    Wishlist.searchLine = value;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
