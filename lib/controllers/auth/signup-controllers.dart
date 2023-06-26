import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../../core/commons.dart';
import '../../core/remote_url.dart';
import 'package:flutter/material.dart';
import '../../core/values/strings.dart';
import '../../modules/dashboard/home.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool obscureText = false.obs;
  RxBool loading = false.obs;

  void signupApi() async {
    loading.value = true;
    try {
      final response = await post(Uri.parse(signup_url), body: {
        "email": emailController.value.text,
        "password": passwordController.value.text,
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        loading.value = false;
        Commons.snackBar(signupSuccess, signupSuccessMsg);
        Future.delayed(
            const Duration(milliseconds: 450), () => Get.to(const Home()));
      } else {
        loading.value = false;
        Commons.snackBar(signupFailed, data["error"]);
      }
    } catch (e) {
      loading.value = false;
      Commons.snackBar('Exception', e.toString());
    }
  }
}
