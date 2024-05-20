import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/products/cart/add_remove_button.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_item.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../controllers/product/product_controller.dart';

class SCartItems extends StatelessWidget {
  const SCartItems(
      {super.key, this.showAddRemoveButtons = true, });



  final bool showAddRemoveButtons;


  @override
  Widget build(BuildContext context) {
        final controller = Get.put(ProductController());

        
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: SSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [

        
          //Cart Item
          const SCartItem(),
          if (showAddRemoveButtons)
            const SizedBox(height: SSizes.spaceBtwItems),

          //Add & Remove Button Row with Total Price

          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Extra Space
                    SizedBox(width: 70),
                    //Add & Remove Buttons
                    SProductQuantityAddRemoveButton(),
                  ],
                ),
                SProductPriceText(price: '256'),
              ],
            )
        ],
      ),
    );
  }
}
