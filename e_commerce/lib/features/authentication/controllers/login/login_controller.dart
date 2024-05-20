import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';

class LoginController extends GetxController {
  //Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    try {
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    } catch (e) {
      return;
    }
    super.onInit();
  }

  //Email & Password Login
  Future<void> emailAndPasswordSignIn() async {
    try {
      //Start Loading
      SFullScreenLoader.openLoadingDialog(
          'We are processing your information...', SImages.docerAnimation);
      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }
      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      //Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      //Login User using Email & Password Authentication
      // ignore: unused_local_variable, non_constant_identifier_names
      final UserCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      SFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //Show some generic error to the user
      SFullScreenLoader.stopLoading();
      SLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  //Google Sign In
  Future<void> googleSignIn() async {
    try {
      //Start Loading
      SFullScreenLoader.openLoadingDialog(
          'We are processing your information...', SImages.docerAnimation);
      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SFullScreenLoader.stopLoading();
        return;
      }

      //Google Authentication
      final UserCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //Save user record
      await userController.saveUserRecord(UserCredentials);

      //Remove Loader
      SFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      //Show some generic error to the user
      SFullScreenLoader.stopLoading();
      SLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
