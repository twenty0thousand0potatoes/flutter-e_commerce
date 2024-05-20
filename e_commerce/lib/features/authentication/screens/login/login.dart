import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/common/styles/spacing_styles.dart';
import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/common/widgets/login_signup/social_buttons.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: SSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            //Logo, Title & Subtitle
            const SLoginHeader(),
            //Form
            const SLoginForm(),
            //Divider
            // SFormDivider(dividerText: STexts.orSignInWith.capitalize!),
            // const SizedBox(height: SSizes.spaceBtwSections),

            //Footer
            // const SSocialButtons(),
          ],
        ),
      )),
    );
  }
}

