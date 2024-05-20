import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/s_circular_image.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/s_brand_title_with_verified_icon.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class SProductMetaData extends StatelessWidget {
  const SProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final stockStatus = controller.getProductStockStatus(product.stock);
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = SHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Price & Sale Price
        Row(
          children: [
            //Sale Tag
            SRoundedContainer(
                radius: SSizes.sm,
                backgroundColor: SColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                  horizontal: SSizes.sm,
                  vertical: SSizes.xs,
                ),
                child: Text(
                  '$salePercentage%',
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: SColors.black,
                      ),
                )),
            const SizedBox(width: SSizes.spaceBtwItems),
            //Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text('\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0) const SizedBox(width: SSizes.spaceBtwItems),
            SProductPriceText(
                price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems / 1.5),
        //Title
        SProductTitleText(title: product.title),
        const SizedBox(height: SSizes.spaceBtwItems / 1.5),
        //Stock Status
        Row(
          children: [
            const SProductTitleText(title: 'Status:'),
            const SizedBox(width: SSizes.spaceBtwItems),
            Text(stockStatus, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: SSizes.spaceBtwItems / 1.5),

        //Brand
        Row(
          children: [
            SCircularImage(
                image: product.brand!= null? product.brand!.image : '',
                width: 32,
                height: 32,
                isNetworkImage: true,
                overlayColor: darkMode ? SColors.white : SColors.black),
            SBrandTitleTextWithVerifiedIcon(
                title: product.brand!= null? product.brand!.name : '', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
