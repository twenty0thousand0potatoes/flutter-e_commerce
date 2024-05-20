import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/s_rounded_image.dart';
import 'package:e_commerce/common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SAppBar(
        showBackArrow: true,
        title: Text('Sub Category'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              //Banner
              const SRoundedImage(
                width: double.infinity,
                imageUrl: SImages.banner4,
                applyImageRadius: true,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              //Sub Categories
              Column(
                children: [
                  //Heading
                  SSectionHeading(
                    title: 'SubCategory Title',
                    onPressed: () {},
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        separatorBuilder: (contex, index) =>
                            const SizedBox(width: SSizes.spaceBtwItems),
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (contex, index) =>
                            const SProductCardHorizontal()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
