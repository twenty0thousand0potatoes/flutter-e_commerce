import 'package:get/get.dart';
import 'package:e_commerce/data/repositories/products/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      //Fetch Products
      final products = await productRepository.getFeaturedProducts();
      //Assign Products
      featuredProducts.assignAll(products);
    } catch (e) {
      SLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

   Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      //Fetch Products
      final products = await productRepository.getAllFeaturedProducts();
      return products;
      
    } catch (e) {
      SLoaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) {
      return null;
    }
    if (originalPrice <= 0) {
      return null;
    }
    return (((originalPrice - salePrice) / originalPrice) * 100.0)
        .toStringAsFixed(0);
  }

  String getProductStockStatus(int stock){
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }
}
