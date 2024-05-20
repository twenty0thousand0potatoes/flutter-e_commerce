import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/s_circular_icon.dart';
import 'package:e_commerce/common/widgets/images/s_rounded_image.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/s_brand_title_with_verified_icon.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_detail.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class SProductCardVertical extends StatelessWidget {
  const SProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = SHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SSizes.productImageRadius),
          color: dark ? SColors.darkerGrey : SColors.white,
        ),
        child: Column(
          children: [
            //Thumbnail, Wishlist Button, Discount Tag
            SRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(SSizes.sm),
              backgroundColor: dark ? SColors.dark : SColors.light,
              child: Stack(
                children: [
                  //Thumbnail Image
                  Center(
                    child: SRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
                    ),
                  ),
                  //Sale Tag
                  Positioned(
                    top: 12,
                    child: SRoundedContainer(
                        radius: SSizes.sm,
                        backgroundColor: salePercentage != null
                            ? SColors.secondary.withOpacity(0.8)
                            : Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: SSizes.sm,
                          vertical: SSizes.xs,
                        ),
                        child: Text(
                          salePercentage != null ? '$salePercentage%' : '',
                          style: Theme.of(context).textTheme.labelLarge!.apply(
                                color: SColors.black,
                              ),
                        )),
                  ),
                  //Favourite Icon Button
                  // const Positioned(
                  //   top: 0,
                  //   right: 0,
                  //   child: SCircularIcon(
                  //     icon: Iconsax.heart5,
                  //     color: Color.fromARGB(255, 157, 157, 157),
                  //   ),
                  // )
                ],
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwItems / 2),
            //Details
            Padding(
              padding: const EdgeInsets.only(left: SSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SProductTitleText(
                      title: product.title,
                      smallSize: true,
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems / 2),
                    SBrandTitleTextWithVerifiedIcon(title: product.brand!.name),
                  ],
                ),
              ),
            ),
            const Spacer(),
            //Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: SSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: SSizes.sm),
                        child: SProductPriceText(
                            price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),
                //Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                      color: SColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(SSizes.cardRadiusMd),
                        bottomRight: Radius.circular(SSizes.cardRadiusMd),
                      )),
                  child: const SizedBox(
                      width: SSizes.iconLg * 1.2,
                      height: SSizes.iconLg * 1.2,
                      child: Center(
                          child: Icon(
                        Iconsax.add,
                        color: SColors.white,
                      ))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
