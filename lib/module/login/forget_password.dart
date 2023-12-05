import 'package:excitech/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 27, top: 25),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.orangeColor,
                ),
              ),
            ),
          ),
          Padding(
            padding:
                // loginController.isItTablet.value
                //     ? EdgeInsets.only(
                //         top: Get.height * 0.25,
                //       )
                //     :
                EdgeInsets.symmetric(vertical: (Get.height - 180) * 0.15),
            child: const SizedBox(
                // height: loginController.isItTablet.value ? 50 : 0,
                ),
          ),
          Padding(
            padding:
                // loginController.isItTablet.value
                //     ? EdgeInsets.only(
                //         left: Get.width * 0.2, right: Get.width * 0.2)
                //     :
                const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              padding:
                  // loginController.isItTablet.value ? const EdgeInsets.all(30) :
                  const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 15, top: 10),
                  //   child: InkWell(
                  //     onTap: () {
                  //       Get.back();
                  //     },
                  //     child: Icon(
                  //       Icons.arrow_back_ios,
                  //       color: AppColors.orangeColor,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 25,
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
                        padding:
                            // loginController.isItTablet.value ? const EdgeInsets.all(5) :
                            const EdgeInsets.all(0),
                        child: TextField(
                          onChanged: (value) {},
                          controller: loginController.emailController,
                          style: const TextStyle(
                              color: Colors.black87, fontSize: 18),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Email Address',
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 18),
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
                    child: ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(Get.width, 49),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      onPressed: () {
                        loginController.forgotPass();
                      },
                      child: Text(
                        "Send mail".toUpperCase(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
