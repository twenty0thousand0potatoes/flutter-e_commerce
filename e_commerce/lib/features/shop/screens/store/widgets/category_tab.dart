import 'package:e_commerce/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/common/widgets/brands/brand_show_case.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

class SCategoryTab extends StatelessWidget {
  const SCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());

    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(SSizes.defaultSpace),
            child: Column(
              children: [
                //Brands
                // const SBrandShowcase(images: [
                //   SImages.hk416Thumb,
                //   SImages.gasMask,
                //   SImages.helmetThumb,
                // ]),
                const SizedBox(height: SSizes.spaceBtwItems),
                //Product
                SSectionHeading(
                  title: 'You might like',
                  buttonTitle: '',
                  onPressed: () {},
                ),
                const SizedBox(height: SSizes.spaceBtwItems),

                Obx(() {
                  if (controller.isLoading.value) {
                    return const SVerticalProductShimmer();
                  }
                  if (controller.featuredProducts.isEmpty) {
                    return Center(
                      child: Text(
                        'No Data Found!',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }

                  if (Wishlist.searchList.isNotEmpty) {
                    return SGridLayout(
                      itemCount: Wishlist.searchList.length,
                      itemBuilder: (_, index) => SProductCardVertical(
                          product: controller.featuredProducts[
                              int.parse(Wishlist.searchList[index]) - 2]),
                    );
                  } else {
                    return SGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => SProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  }
                }),
              ],
            ),
          ),
        ]);
  }
}
