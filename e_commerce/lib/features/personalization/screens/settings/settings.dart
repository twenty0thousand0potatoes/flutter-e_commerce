import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:e_commerce/common/widgets/list_tile/user_profile_tile.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/data/data/some_data.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/data/repositories/banners/banner_repository.dart';
import 'package:e_commerce/data/repositories/categories/category_repository.dart';
import 'package:e_commerce/data/repositories/products/product_repository.dart';
import 'package:e_commerce/features/personalization/screens/address/address.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce/features/shop/screens/order/order.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerCategory = Get.put(CategoryRepository());
    final controllerBanners = Get.put(BannerRepository());
    final controllerProducts = Get.put(ProductRepository());
    final categories = SDummyData.categories;
    final banners = SDummyData.banners;
    final products = SDummyData.products;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            SPrimaryHeaderContainer(
                child: Column(
              children: [
                SAppBar(
                    title: Text('Your Account',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: SColors.white))),

                //User Profile Card
                SUserProfileTile(
                    onPressed: () => Get.to(() => const ProfileScreen())),
                const SizedBox(height: SSizes.spaceBtwSections),
              ],
            )),
            //Body
            Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  //Account Settings
                  const SSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: SSizes.spaceBtwItems),
                  SSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Adresses',
                    subTitle: 'Set My Adresses',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  SSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Orders',
                    subTitle: 'Orders Status',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
       
                  //App Settings

                  // const SizedBox(height: SSizes.spaceBtwSections),
                  // const SSectionHeading(
                  //   title: 'App Settings',
                  //   showActionButton: false,
                  // ),
                  // const SizedBox(height: SSizes.spaceBtwItems),
                  // SSettingsMenuTile(
                  //   icon: Iconsax.safe_home,
                  //   title: 'Load Categories Data',
                  //   subTitle: 'Upload Categories Data To Your Cloud Firebase',
                  //   onTap: () => controllerCategory.uploadSomeData(categories),
                  // ),
                  // SSettingsMenuTile(
                  //   icon: Iconsax.glass,
                  //   title: 'Load Banners Data',
                  //   subTitle: 'Upload Banners Data To Your Cloud Firebase',
                  //   onTap: () => controllerBanners.uploadBannerData(banners),
                  // ),
                  // SSettingsMenuTile(
                  //   icon: Iconsax.global,
                  //   title: 'Load Product Data',
                  //   subTitle: 'Upload Products Data To Your Cloud Firebase',
                  //   onTap: () => controllerProducts.uploadProductData(products),
                  // ),
                  // //LogoutBatton
                  const SizedBox(height: SSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(63, 255, 0, 0),
                        ),
                        child: const Text('Logout')),
                  ),
                  const SizedBox(height: SSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
