// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../resource/color.dart';
import '../../service.dart';

class CustomerController extends GetxController {
  RxList<String> imagePath = <String>[].obs;
  TextEditingController commentController = TextEditingController();

  void getImages(bool captureFromCamera) async {
    if (imagePath.value.length < 10) {
      try {
        XFile? pickedImage = await ImagePicker().pickImage(
          source: captureFromCamera ? ImageSource.camera : ImageSource.gallery,
          maxHeight: 600,
          maxWidth: 600,
        );
        File image = File(pickedImage?.path ?? "");
        if (image == null) {
          return;
        } else {
          imagePath.add(pickedImage?.path ?? "");
        }
      } on PlatformException catch (e) {
        print("Unsupported operation$e");
      }
    } else {
      Get.snackbar("You have already selected 10 files Photos",
          'You have already selected 10 files Photos',
          backgroundColor: Colors.red);
    }
  }

  riseRequest(itemId) {
    return showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(2.0),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Select up to 10 images',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                      height: Get.height *0.5,
                      child: Column(children: [
                        TextButton(
                          onPressed: () {
                            getImages(true);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                AppColors.orangeColor),
                          ),
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 2),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                      text: ' Take Images',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            getImages(false);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                AppColors.orangeColor),
                          ),
                          child: Center(
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 2),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                      text: ' Upload Photo',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Obx(() {
                          if (imagePath.isNotEmpty) {
                            return Expanded(
                              child: GridView.builder(
                                itemCount: imagePath.value.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (BuildContext context, int i) {
                                  return Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 2, 0, 2),
                                    child: Card(
                                      elevation: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.file(
                                                File(imagePath[i]),
                                                // height:
                                                //     constraints.maxHeight,
                                                // width:
                                                //     constraints.maxWidth
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () async {
                                                    imagePath.removeAt(i);
                                                  },
                                                  child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      child: const Text(
                                                          'Delete',
                                                          textAlign: TextAlign
                                                              .center)),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return const SizedBox(
                              height: 100,
                            );
                          }
                        }),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.topLeft,
                      child: TextField(
                        controller: commentController,
                        onSubmitted: (abc) {},
                        style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 13,
                          fontFamily: "AVENIRLTSTD",
                        ),
                        textInputAction: TextInputAction.newline,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Your Comments Here",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color(0xff999999),
                            fontFamily: "AVENIRLTSTD",
                          ),
                        ),
                        onChanged: (abc) {
                          // widget.data.comment = abc;
                        },
                        maxLines: 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          if (imagePath.value.isNotEmpty) {
                            if (commentController.text.isNotEmpty) {
                              var data = await ApiClass().serviceRequest(
                                itemId,
                                commentController.text,
                                imagePath.value,
                              );
                              if (data != null) {
                                if (data['success'] == true) {
                                  Get.back();
                                  imagePath.value = [];
                                  commentController.clear();
                                  Get.snackbar("Request send successfully", "");
                                } else {
                                  print("forgotPass responce : $data");
                                  Get.snackbar("${data['messages']}", "");
                                }
                              }
                            } else {
                              Get.snackbar("Please add comment", "");
                            }
                          } else {
                            Get.snackbar("Please add at least one image", "");
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.orangeColor,
                          ),
                          alignment: Alignment.center,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 13, horizontal: 5),
                            child: Text(
                              "Save & Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          imagePath.value = [];
                          commentController.clear();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: AppColors.orangeColor, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 5),
                            child: Text(
                              "Close ",
                              style: TextStyle(
                                  color: AppColors.orangeColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
