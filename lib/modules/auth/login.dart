import 'package:job_login_getx/controllers/auth/login-controllers.dart';

import 'signup.dart';
import 'package:get/get.dart';
import '../../core/commons.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../widgets/buttons/primary_buttons.dart';
import 'package:job_login_getx/core/values/values.dart';
import '../../widgets/forms/text_input_with _label.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaKey = GlobalKey<ScaffoldState>();

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        key: _scaKey,
        body: SafeArea(
          child: loginContainer(),
        ));
  }

  Widget loginContainer() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpaceMedium,
                titleTxt(),
                verticalSpaceSmall,
                subTitleTxt(),
                verticalSpaceRegular,
                TextFormInput(
                  placeholder: "Email",
                  keyboardType: "text",
                  controller: loginController.emailController.value,
                  obscureText: loginController.obscureText.value,
                  label: "Your Email",
                  validatorFunction: (String? val) {
                    if (val!.isEmpty == true) emailEmptyErrorMsg;
                    return null;
                  },
                ),
                verticalSpaceMedium,
                Obx(
                  () => TextFormInput(
                    placeholder: "Password",
                    keyboardType: "text",
                    controller: loginController.passwordController.value,
                    obscureText: !loginController.obscureText.value,
                    label: "Your Password",
                    validatorFunction: (String? val) {
                      if (val!.isEmpty == true) passwordEmptyErrorMsg;
                      return null;
                    },
                    showPasswordValue: () => loginController.obscureText.value =
                        !loginController.obscureText.value,
                  ),
                ),
                verticalSpaceMedium,
                Obx(
                  () => loginController.loading.value
                      ? const SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                            strokeWidth: 2,
                          ),
                        )
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: AppPrimaryButton(
                              buttonHeight: 40,
                              buttonWidth: sizeWidth * 0.35,
                              buttonText: login_button,
                              callback: () => loginController.loginApi()),
                        ),
                ),
                verticalSpaceMedium,
                accountTxt(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget titleTxt() {
    return Text(login_title, style: AppTextStyles.header);
  }

  Widget subTitleTxt() {
    return Text(login_sub_title, style: AppTextStyles.subHeader);
  }

  Widget accountTxt() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: RichText(
        text: TextSpan(
          text: exist_acc_txt,
          style: AppTextStyles.normalText,
          children: <TextSpan>[
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () => Get.to(() => const Signup()),
              text: signup_text,
              style: AppTextStyles.highlightText,
            ),
          ],
        ),
      ),
    );
  }
}
