import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import '../../modules/dashboard/home.dart';
import 'package:job_login_getx/core/commons.dart';
import 'package:job_login_getx/core/remote_url.dart';
import 'package:job_login_getx/core/values/strings.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool obscureText = false.obs;
  RxBool loading = false.obs;

  void loginApi() async {
    loading.value = true;
    try {
      final response = await post(Uri.parse(login_url), body: {
        "email": emailController.value.text,
        "password": passwordController.value.text
      });
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        loading.value = false;
        Commons.snackBar(loginSuccess, loginSuccessMsg);
        Future.delayed(
            const Duration(milliseconds: 450), () => Get.to(const Home()));
      } else {
        loading.value = false;
        Commons.snackBar(loginFailed, data["error"]);
      }
    } catch (e) {
      loading.value = false;
      Commons.snackBar('Exception', e.toString());
    }
  }
}
