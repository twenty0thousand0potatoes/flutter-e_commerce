import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //Sent Reset Password Email
  sentPasswordResetEmail() async {
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
      if (!forgetPasswordFormKey.currentState!.validate()) {
        SFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      //Stop Loading
      SFullScreenLoader.stopLoading();

      //Show Success
      SLoaders.successSnackBar(
        title: 'Success',
        message: 'We have sent you an email to reset your password'.tr,
      );

      //Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      //Stop Loading
      SFullScreenLoader.stopLoading();
      //Show Error
      SLoaders.errorSnackBar(
        title: 'Error',
        message: e.toString().tr,
      );
    }
  }

  resentPasswordResetEmail(String email) async {
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

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      //Stop Loading
      SFullScreenLoader.stopLoading();

      //Show Success
      SLoaders.successSnackBar(
        title: 'Success',
        message: 'We have sent you an email to reset your password'.tr,
      );

    } catch (e) {
      //Stop Loading
      SFullScreenLoader.stopLoading();
      //Show Error
      SLoaders.errorSnackBar(
        title: 'Error',
        message: e.toString().tr,
      );
    }
  }
}
