import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SPrimaryHeaderContainer(
              child: Column(children: [
                //AppBar
                SHomeAppBar(),
                SizedBox(height: SSizes.spaceBtwSections),
                //SearchBar
                // SSearchContainer(text: 'Search'),
                // SizedBox(height: SSizes.spaceBtwSections),
                //Categories
                Padding(
                  padding: EdgeInsets.only(left: SSizes.defaultSpace),
                  child: Column(
                    children: [
                      //Heading
                      SSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: SColors.white,
                      ),
                      SizedBox(height: SSizes.spaceBtwItems),
                      //Categories
                      SHomeCategories()
                    ],
                  ),
                ),
                SizedBox(height: SSizes.spaceBtwSections),
              ]),
            ),
            //Body
            Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  // //Promo Slider
                  // const SPromoSlider(),
                  const SizedBox(height: SSizes.spaceBtwSections),
                  //Heading
                  SSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(
                      () => AllProductsScreen(
                        title: 'Popular Products',
                            futureMethod: controller.fetchAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),
                  //Popular Products
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
                    return SGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => SProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
