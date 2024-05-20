import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:e_commerce/common/widgets/shimmers/category_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/screens/sub_category/sub_categories.dart';

import '../../store/store.dart';

class SHomeCategories extends StatelessWidget {
  const SHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return const SCategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text('No Data Found',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white)),
        );
      }
      return SizedBox(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return SVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const StoreScreen()),
            );
          },
        ),
      );
    });
  }
}
