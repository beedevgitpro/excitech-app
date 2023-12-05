import 'package:excitech/module/login/login_controller.dart';
import 'package:excitech/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

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
                    horizontal: 10, vertical: (Get.height - 250) * 0.2),
                child: const SizedBox(
                    // height: loginController.isItTablet.value ? 50 : 0,
                    ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        "New Password",
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
                                width: 1,
                                color: const Color(0XFFced4da),
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextField(
                            onChanged: (value) {
                              // loginController.newPassword.value = value;
                            },
                            obscureText: true,
                            controller: loginController.newPassWordController,
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 18),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              hintText: 'New Password',
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        "Confirm Password",
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
                              width: 1,
                              color: const Color(0XFFced4da),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(0),
                          child: TextField(
                            onChanged: (value) {
                              // loginController.confirmPassword.value = value;
                            },
                            obscureText: true,
                            controller:
                                loginController.confirmPassWordController,
                            style: const TextStyle(
                                color: Colors.black87, fontSize: 18),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 15, right: 15),
                      child: Obx(() {
                        if (loginController.isReset.value) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: AppColors.orangeColor,
                              ),
                            ),
                          );
                        } else {
                          return ElevatedButton(
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                  Size(Get.width, 49),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            onPressed: () {
                              loginController.resetValidate();
                            },
                            child: Text(
                              "Reset Password".toUpperCase(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          );
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
