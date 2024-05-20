import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class SSingleAddress extends StatefulWidget {
  const SSingleAddress({Key? key}) : super(key: key);

  @override
  _SSingleAddressState createState() => _SSingleAddressState();
}

class _SSingleAddressState extends State<SSingleAddress> {
  bool selectedAddress = false;

  void _toggleSelection() {
    setState(() {
      selectedAddress = !selectedAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: _toggleSelection,
      child: SRoundedContainer(
        padding: const EdgeInsets.all(SSizes.md),
        width: double.infinity,
        showBorder: true,
        backgroundColor: selectedAddress
            ? SColors.primary.withOpacity(0.5)
            : Colors.transparent,
        borderColor: selectedAddress
            ? Colors.transparent
            : dark
                ? SColors.darkerGrey
                : SColors.grey,
        margin: const EdgeInsets.only(bottom: SSizes.spaceBtwItems),
        child: Stack(
          children: [
            if (selectedAddress)
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  Iconsax.tick_circle5,
                  color: dark ? SColors.light : SColors.dark,
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '22',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: SSizes.sm / 2),
                const Text(
                  '3333333333',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: SSizes.sm / 2),
                const Text(
                  'Pushkin Street, Kolotushkin house',
                  softWrap: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}