import 'package:excitech/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../customer/customer_home_page.dart';
import '../home_page/home_page.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController newPassWordController = TextEditingController();
  TextEditingController confirmPassWordController = TextEditingController();
  RxBool callLoginApi = false.obs;
  RxString userName = "".obs;
  RxInt role = 0.obs;
  // RxBool isItTablet = false.obs;
  RxBool isReset = false.obs;

  forgotPass() async {
    var data = await ApiClass().forgotPassword(emailController.text);
    if (data != null) {
      if (data['success'] == true) {
        emailController.clear();
        Get.back();
      } else {
        print("forgotPass responce : $data");
        Get.snackbar("${data['messages']}", "");
      }
    }
  }

  findTheDeviceSize() async {
    // double deviceSize = MediaQuery.of(Get.context!).size.width;
    // if (deviceSize <= 450) {
    //   isItTablet.value = false;
    // } else {
    //   isItTablet.value = true;
    // }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user_name') != null) {
      userName.value = prefs.getString('user_name') ?? "";
    }
    if (prefs.getInt('role') != null) {
      role.value = prefs.getInt('role') ?? 0;
    }
  }

  login() async {
    if (emailController.text.isEmpty) {
      return Get.snackbar("email field is empty", '');
    }
    if (passWordController.text.isEmpty) {
      return Get.snackbar("Password field is empty", "");
    }
    callLoginApi.value = true;
    var loginApi = await ApiClass()
        .loginApi(emailController.text, passWordController.text);
    if (loginApi != null) {
      if (loginApi['success'] == true) {
        if (loginApi['role'].toString() == "3") {
          Get.offAll(const HomePage());
        } else {
          Get.offAll(CustomerHomePage());
        }
        emailController.clear();
        passWordController.clear();
      } else {
        Get.snackbar(loginApi['erros_status'], '');
      }
    } else {
      Get.snackbar("Login response empty", '');
    }
    callLoginApi.value = false;
  }

  resetValidate() async {
    isReset.value = true;
    if (newPassWordController.text.isEmpty) {
      isReset.value = false;
      return Get.snackbar('Please enter new password', "");
    }
    if (newPassWordController.text.isEmpty) {
      isReset.value = false;
      return Get.snackbar('Please enter confirm password', "");
    }
    if (newPassWordController.text != newPassWordController.text) {
      isReset.value = false;
      return Get.snackbar('new password and confirm password is mismatch', "");
    }
    isReset.value = false;
    var data = await ApiClass().resetPassword(
        newPassWordController.text, confirmPassWordController.text);
    if (data != null) {
      if (data['success'] == true) {
        Get.back();
      } else {
        print("forgotPass response : $data");
        Get.snackbar("${data['messages']}", "");
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    findTheDeviceSize();
    super.onInit();
  }
}
