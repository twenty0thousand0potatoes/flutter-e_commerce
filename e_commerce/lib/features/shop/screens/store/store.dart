import 'package:e_commerce/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/appbar/tabbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce/common/widgets/shimmers/brand_shimmer.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/screens/brand/all_brands.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: SAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [SCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
            //Header
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: SHelperFunctions.isDarkMode(context)
                      ? SColors.black
                      : SColors.white,
                  expandedHeight: 180,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(SSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        //Search Bar
                        const SizedBox(height: SSizes.spaceBtwItems),
                         SSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                        ),
                        //Featured Brands
                        // SSectionHeading(
                        //     title: 'Featured Brands',
                        //     onPressed: () =>
                        //         Get.to(() => const AllBrandsScreen())),
                        // Obx(() {
                        //   if (brandController.isLoading.value) {
                        //     return const SBrandShimmer();
                        //   }

                        //   if (brandController.featuredBrands.isEmpty) {
                        //     return Center(
                        //         child: Text(
                        //       'No brands found',
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .bodyMedium!
                        //           .apply(color: Colors.white),
                        //     ));
                        //   }
                        //   return SGridLayout(
                        //       itemCount: brandController.featuredBrands.length,
                        //       mainAxisExtent: 80,
                        //       itemBuilder: (_, index) {
                        //         final brand =
                        //             brandController.featuredBrands[index];
                        //         return SBrandCard(
                        //           brand: brand,
                        //           showBorder: false,
                        //         );
                        //       });
                        // })
                      ],
                    ),
                  ),
                  //Tabs
                  bottom: STabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList(),
                  ),
                ),
              ];
            },
            body: TabBarView(
                children: categories
                    .map((category) => SCategoryTab(category: category))
                    .toList())),
      ),
    );
  }
}
