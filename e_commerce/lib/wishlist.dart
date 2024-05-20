class Wishlist {
  const Wishlist._();

  static final List<String> wishList = [];

    static final List<String> searchList = [];

 static void addProductSearch(String product) {
    searchList.add(product);
  }


  static void addProduct(String product) {
    wishList.add(product);
  }

  static void removeProduct(String product) {
    wishList.remove(product);
  }

  static bool containsProduct(String product) {
    return wishList.contains(product);
  }

  static String activeCategory = '';

  static String searchLine = '';

  static final List <String> cartList = [];

    static void addProductCart(String product) {
    cartList.add(product);
  }

  static void removeProductCart(String product) {
    cartList.remove(product);
  }

  static bool containsProductCart(String product) {
    return cartList.contains(product);
  }
}