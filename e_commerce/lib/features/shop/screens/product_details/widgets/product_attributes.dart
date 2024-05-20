import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/product/variation_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = SHelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(children: [
        //Selected Attribute Pricing & Description
        if (controller.selectedVariation.value.id.isNotEmpty)
          SRoundedContainer(
            padding: const EdgeInsets.all(SSizes.md),
            backgroundColor: dark ? SColors.darkerGrey : SColors.grey,
            child: Column(
              children: [
                //Title, Price and Stock Status
                Row(
                  children: [
                    const SSectionHeading(
                      title: 'Variation',
                      showActionButton: false,
                    ),
                    const SizedBox(width: SSizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SProductTitleText(
                                title: 'Price : ', smallSize: true),
                            //Actual Price
                            if(controller.selectedVariation.value.salePrice > 0)
                            Text(
                              '\$${controller.selectedVariation.value.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough),
                            ),
                            if(controller.selectedVariation.value.salePrice > 0)
                            const SizedBox(width: SSizes.spaceBtwItems),
                            //Sale Price
                            SProductPriceText(price: controller.getVariationPrice()),
                          ],
                        ),
                        //Stock
                        Row(
                          children: [
                            const SProductTitleText(
                                title: 'Stock : ', smallSize: true),
                            Text(controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                //Variation Description
                SProductTitleText(
                  title:
                      controller.selectedVariation.value.description ?? '',
                  smallSize: true,
                  maxLines: 4,
                )
              ],
            ),
          ),
        const SizedBox(height: SSizes.spaceBtwItems),
        //Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!
              .map(
                (attribute) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SSectionHeading(
                        title: attribute.name ?? '', showActionButton: false),
                    const SizedBox(height: SSizes.spaceBtwItems / 2),
                    Obx(
                      () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue;
                            final available = controller
                                .getAttributesAvaibilityInVariation(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValue);
                            return SChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              attributeValue);
                                        }
                                      }
                                    : null);
                          }).toList()),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ]),
    );
  }
}
