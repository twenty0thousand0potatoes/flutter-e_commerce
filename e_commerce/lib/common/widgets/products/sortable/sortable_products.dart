import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:e_commerce/features/shop/controllers/product/all_products_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

class SSortableProducts extends StatelessWidget {
  const SSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(children: [
      //Dropdown
      DropdownButtonFormField(
        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        value: controller.selectedSortOption.value,
        onChanged: (value) {
          controller.sortProduct(value!);
        },
        items:
            ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popular']
                .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ))
                .toList(),
      ),
      const SizedBox(height: SSizes.spaceBtwSections),
      //Products
      Obx(
        () => SGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) =>
                SProductCardVertical(product: controller.products[index])),
      )
    ]);
  }
}
