// ignore_for_file: depend_on_referenced_packages

import 'package:excitech/module/customer/customer_home_page.dart';
import 'package:excitech/module/customer/warranty_items.dart';
import 'package:excitech/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../customer/service_screen.dart';
import '../login/login_controller.dart';
import '../login/login_page.dart';
import '../login/reset_password.dart';
import 'home_page.dart';
import 'home_page_controller.dart';

class ExciTechDrawer extends StatelessWidget {
  ExciTechDrawer({Key? key}) : super(key: key);
  HomePageController homePageController = Get.put(HomePageController());
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: Get.width - 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            Center(
              child: DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 45,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        loginController.userName.value,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            loginController.role.value != 3
                ? Padding(
                    padding: const EdgeInsets.only(top: 0, left: 10),
                    child: ListTile(
                        leading: Icon(
                          Icons.list_alt,
                          color: AppColors.orangeColor,
                          size: 28,
                        ),
                        title: const Text(
                          'Orders',
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () async {
                          Get.back();
                          Get.to(CustomerHomePage());
                        }),
                  )
                : const SizedBox(),
            loginController.role.value != 3
                ? Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      height: 1,
                      width: 500,
                      decoration: BoxDecoration(
                          color: AppColors.lightColor.withOpacity(0.5)),
                    ),
                  )
                : const SizedBox(),
            loginController.role.value != 3
                ? Padding(
                    padding: const EdgeInsets.only(top: 0, left: 10),
                    child: ListTile(
                        leading: Icon(
                          Icons.list_alt,
                          color: AppColors.orangeColor,
                          size: 28,
                        ),
                        title: const Text(
                          'Warranty',
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () async {
                          Get.to(WarrantyOrders());
                        }),
                  )
                : const SizedBox(),
            loginController.role.value != 3
                ? Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      height: 1,
                      width: 500,
                      decoration: BoxDecoration(
                          color: AppColors.lightColor.withOpacity(0.5)),
                    ),
                  )
                : const SizedBox(),
            loginController.role.value != 3
                ? Padding(
                    padding: const EdgeInsets.only(top: 0, left: 10),
                    child: ListTile(
                        leading: Icon(
                          Icons.list_alt,
                          color: AppColors.orangeColor,
                          size: 28,
                        ),
                        title: const Text(
                          'Service',
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () async {
                          Get.to(ServiceScreen());
                        }),
                  )
                : const SizedBox(),
            loginController.role.value != 3
                ? Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      height: 1,
                      width: 500,
                      decoration: BoxDecoration(
                          color: AppColors.lightColor.withOpacity(0.5)),
                    ),
                  )
                : const SizedBox(),
            loginController.role.value == 3
                ? Padding(
                    padding: const EdgeInsets.only(top: 0, left: 10),
                    child: ListTile(
                        leading: Icon(
                          Icons.list,
                          color: AppColors.orangeColor,
                          size: 28,
                        ),
                        title: const Text(
                          'Job List',
                          style: TextStyle(fontSize: 20),
                        ),
                        onTap: () async {
                          Get.back();
                          Get.to(const HomePage());
                        }),
                  )
                : const SizedBox(),
            loginController.role.value == 3
                ? Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      height: 1,
                      width: 500,
                      decoration: BoxDecoration(
                          color: AppColors.lightColor.withOpacity(0.5)),
                    ),
                  )
                : const SizedBox(),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 10),
              child: ListTile(
                  leading: Icon(
                    Icons.lock_reset,
                    color: AppColors.orangeColor,
                    size: 28,
                  ),
                  title: const Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () async {
                    Get.to(
                      () => ResetPassword(),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 1,
                width: 500,
                decoration:
                    BoxDecoration(color: AppColors.lightColor.withOpacity(0.5)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 10),
              child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: AppColors.orangeColor,
                    size: 28,
                  ),
                  title: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () async {
                    Get.back();
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear();
                    Get.offAll(
                      () => LoginPage(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
