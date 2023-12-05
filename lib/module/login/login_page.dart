import 'package:excitech/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resource/image.dart';
import 'forget_password.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10, vertical: (Get.height - 430) * 0.2),
                child: const SizedBox(),
              ),
              Container(
                decoration: BoxDecoration(
                  // color: AppColors.backGroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 30, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImageString.loginImage,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Email Address",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 7, left: 15, right: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0XFFced4da)),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextField(
                            onChanged: (value) {
                              // loginController.email.value = value;
                            },
                            controller: loginController.emailController,
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 18),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 7, left: 15, right: 15),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0XFFced4da)),
                              borderRadius: BorderRadius.circular(5)),
                          padding:
                              // loginController.isItTablet.value
                              //     ? const EdgeInsets.all(5)
                              //     :
                              const EdgeInsets.all(0),
                          child: TextField(
                            onChanged: (value) {
                              // loginController.password.value = value;
                            },
                            obscureText: true,
                            controller: loginController.passWordController,
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 18),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 15, right: 15),
                      child: Obx(() {
                        if (loginController.callLoginApi.value) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                  color: AppColors.orangeColor),
                            ),
                          );
                        } else {
                          return ElevatedButton(
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                  Size(Get.width, 49),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.orangeColor)),
                            onPressed: () {
                              loginController.login();
                            },
                            child: Text(
                              "Login".toUpperCase(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          );
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Get.to(ForgotPassword());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, right: 10),
                          child: Text(
                            "Forgot Your Password?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "v1.0.0",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
