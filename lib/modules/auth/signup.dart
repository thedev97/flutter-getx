import 'package:get/get.dart';
import '../../core/commons.dart';
import '../../core/values/sizes.dart';
import '../../core/values/values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/values/strings.dart';
import '../../widgets/buttons/primary_buttons.dart';
import 'package:job_login_getx/modules/auth/login.dart';
import '../../widgets/forms/text_input_with _label.dart';
import 'package:job_login_getx/controllers/auth/signup-controllers.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaKey = GlobalKey<ScaffoldState>();

  SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        key: _scaKey,
        body: SafeArea(
          child: signupContainer(),
        ));
  }

  Widget signupContainer() {
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
                  controller: signupController.emailController.value,
                  obscureText: signupController.obscureText.value,
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
                    controller: signupController.passwordController.value,
                    obscureText: !signupController.obscureText.value,
                    label: "Your Password",
                    validatorFunction: (String? val) {
                      if (val!.isEmpty == true) passwordEmptyErrorMsg;
                      return null;
                    },
                    showPasswordValue: () => signupController.obscureText
                        .value = !signupController.obscureText.value,
                  ),
                ),
                verticalSpaceMedium,
                Obx(
                  () => signupController.loading.value
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
                              buttonText: signup_button,
                              callback: () => signupController.signupApi()),
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
    return Text(signup_title, style: AppTextStyles.header);
  }

  Widget subTitleTxt() {
    return Text(signup_sub_title, style: AppTextStyles.subHeader);
  }

  Widget accountTxt() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: RichText(
        text: TextSpan(
          text: login_acc_txt,
          style: AppTextStyles.normalText,
          children: <TextSpan>[
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () => Get.to(() => Login()),
              text: login_text,
              style: AppTextStyles.highlightText,
            ),
          ],
        ),
      ),
    );
  }
}
