import 'dart:async';

import 'package:excitech/module/customer/customer_home_page.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page/home_page.dart';
import '../login/login_page.dart';

class SplashController extends GetxController {
  void validateUser() async {
    var savedData = await checkToken();
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Timer(
      const Duration(seconds: 3),
      () {
        if (savedData == null) {
          Get.offAll(
            () => LoginPage(),
          );
        } else if (savedData == true) {
          if (prefs.getInt('role').toString() == "3") {
            Get.offAll(const HomePage());
          } else {
            Get.offAll(CustomerHomePage());
          }
        } else {
          Get.offAll(
            () => LoginPage(),
          );
        }
      },
    );
  }

  checkToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user_token') != null) {
      var type = prefs.getString('user_token');
      if (type != null) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    validateUser();
    super.onInit();
  }
}
