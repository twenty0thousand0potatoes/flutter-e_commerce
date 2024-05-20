import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/sizes.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:  SBottomAddToCard(productId: product.id),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Product Image Slider
              SProductImageSlider(
                product: product,
              ),
              //Product Details
              Padding(
                padding: const EdgeInsets.only(
                  right: SSizes.defaultSpace,
                  left: SSizes.defaultSpace,
                  bottom: SSizes.defaultSpace,
                ),
                child: Column(
                  children: [
                    //Rating & Share Button
                    // const SRatingAndShare(),
                    //Price, Title, Stock, Brand
                    SProductMetaData(product: product),
                    //Attributes
                    if (product.productType == ProductType.variable.toString())
                      ProductAttributes(product: product),

                    if (product.productType == ProductType.variable.toString())
                      const SizedBox(height: SSizes.spaceBtwSections),
                    //Checkout button
                    // SizedBox(
                    //     width: double.infinity,
                    //     child: ElevatedButton(
                    //       onPressed: () {},
                    //       child: const Text('Checkout'),
                    //     )),
                    const SizedBox(height: SSizes.spaceBtwSections),
                    //Description
                    const SSectionHeading(
                        title: 'Description', showActionButton: false),
                    const SizedBox(height: SSizes.spaceBtwItems),
                    ReadMoreText(
                      product.description ?? '',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Less',
                      moreStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    //Reviews
                    // const Divider(),
                    // const SizedBox(height: SSizes.spaceBtwItems),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const SSectionHeading(
                    //         title: 'Reviews(199)', showActionButton: false),
                    //     IconButton(
                    //         icon: const Icon(Iconsax.arrow_right_3, size: 18),
                    //         onPressed: () =>
                    //             Get.to(() => const ProductReviewsScreen()))
                    //   ],
                    // ),
                    // const SizedBox(height: SSizes.spaceBtwSections),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
