import 'package:get/get.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/features/personalization/screens/address/address.dart';
import 'package:e_commerce/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce/features/personalization/screens/settings/settings.dart';
import 'package:e_commerce/features/shop/screens/cart/cart.dart';
import 'package:e_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/order/order.dart';
import 'package:e_commerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_commerce/features/shop/screens/store/store.dart';
import 'package:e_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_commerce/routes/routes.dart';

class AppRoutes{
  static final pages = [
    GetPage(name: SRoutes.home, page: ()=> const HomeScreen()),
    GetPage(name: SRoutes.store, page: ()=> const StoreScreen()),
    GetPage(name: SRoutes.favourites, page: ()=> const FavouriteScreen()),
    GetPage(name: SRoutes.settings, page: ()=> const SettingsScreen()),
    GetPage(name: SRoutes.productReviews, page: ()=> const ProductReviewsScreen()),
    GetPage(name: SRoutes.order, page: ()=> const OrderScreen()),
    GetPage(name: SRoutes.checkout, page: ()=> const CheckoutScreen()),
    GetPage(name: SRoutes.cart, page: ()=> const CartScreen()),
    GetPage(name: SRoutes.userAddress, page: ()=> const UserAddressScreen()),
    GetPage(name: SRoutes.userProfile, page: ()=> const ProfileScreen()),
    GetPage(name: SRoutes.verifyEmail, page: ()=> const VerifyEmailScreen()),
    GetPage(name: SRoutes.forgetPassword, page: ()=> const ForgetPassword()),
    GetPage(name: SRoutes.onBoarding, page: ()=> const OnBoardingScreen()),
    GetPage(name: SRoutes.signIn, page: ()=> const LoginScreen()),
    GetPage(name: SRoutes.signup, page: ()=> const SignupScreen()),

  ];
}