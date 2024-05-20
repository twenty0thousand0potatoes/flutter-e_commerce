import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_commerce/common/widgets/icons/s_circular_icon.dart';
import 'package:e_commerce/common/widgets/images/s_rounded_image.dart';
import 'package:e_commerce/features/shop/controllers/product/images_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/wishlist.dart';

class SProductImageSlider extends StatelessWidget {
  const SProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return SCurveEdgeWidget(
      child: Container(
        color: dark ? SColors.darkerGrey : SColors.light,
        child: Stack(
          children: [
            //Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(SSizes.productImageRadius * 2),
                child: Center(child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: SColors.primary,
                      ),
                    ),
                  );
                })),
              ),
            ),
            //Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: SSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: SSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return SRoundedImage(
                      width: 80,
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                      isNetworkImage: true,
                      imageUrl: images[index],
                      padding: const EdgeInsets.all(SSizes.sm),
                      border: Border.all(
                          color: imageSelected
                              ? SColors.primary
                              : Colors.transparent),
                      backgroundColor: dark ? SColors.dark : SColors.white,
                    );
                  }),
                ),
              ),
            ),

            //Appbar Icons
             SAppBar(
              showBackArrow: true,
              actions: [
                SCircularIcon(
                  icon: Iconsax.heart5,
                  color: Color.fromARGB(255, 138, 138, 138),
                  onPressed: () {
              if (Wishlist.containsProduct(product.id)) {
                Wishlist.removeProduct(product.id);
              } else {
                Wishlist.addProduct(product.id);
              }
            }
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
