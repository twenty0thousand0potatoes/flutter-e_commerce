import 'package:flutter/material.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/shimmers/shimmer.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

class SVerticalProductShimmer extends StatelessWidget {
  const SVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SShimmerEffect(width: 180, height: 180),
            SizedBox(height: SSizes.spaceBtwItems),
            SShimmerEffect(width: 160, height: 15),
            SizedBox(height: SSizes.spaceBtwItems / 2),
            SShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
