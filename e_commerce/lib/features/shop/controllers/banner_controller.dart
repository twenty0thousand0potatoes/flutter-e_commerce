import 'package:get/get.dart';
import 'package:e_commerce/data/repositories/banners/banner_repository.dart';
import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/utils/popups/loaders.dart';

class BannerController extends GetxController {
  //Variables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  //Update Page Navigation dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  //Fetch banners
  Future<void> fetchBanners() async {
    try {
      //Show loader while loading categories
      isLoading.value = true;

      //Fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();
      //Assign banners
      this.banners.assignAll(banners);
    } catch (e) {
      SLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      //Remove loader
      isLoading.value = false;
    }
  }
}
