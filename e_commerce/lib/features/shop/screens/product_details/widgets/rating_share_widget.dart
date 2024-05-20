import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

class SRatingAndShare extends StatelessWidget {
  const SRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Rating
        Row(
          children: [
            const Icon(Iconsax.star5,
                color: Colors.amber, size: 24),
            const SizedBox(width: SSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: '4.7',
                    style: Theme.of(context).textTheme.bodyLarge),
                const TextSpan(text: '(199)'),
              ],
            )),
          ],
        ),
        //Share Button
       
      ],
    );
  }
}
