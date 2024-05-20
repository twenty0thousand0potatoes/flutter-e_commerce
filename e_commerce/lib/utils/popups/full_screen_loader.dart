import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';

class SFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: SHelperFunctions.isDarkMode(Get.context!)
              ? SColors.dark
              : SColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            const SizedBox(height: 250),
            SAnimationLoaderWidget(text: text, animation: animation),
          ]),
        ),
      ),
    );
  }
  
static stopLoading() {
  Navigator.of(Get.overlayContext!).pop();
}
}

