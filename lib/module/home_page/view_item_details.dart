import 'package:excitech/models/item_model.dart';
import 'package:excitech/module/home_page/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../resource/color.dart';
import '../../service.dart';

class ViewOrderDetails extends StatefulWidget {
  ViewOrderDetails({super.key, this.cusomerName, this.orderId});
  var cusomerName;
  var orderId;

  @override
  State<ViewOrderDetails> createState() => _ViewOrderDetailsState();
}

class _ViewOrderDetailsState extends State<ViewOrderDetails> {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "JOB ID #${widget.orderId} ",
          // ": ${widget.orderId}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: AppColors.orangeColor,
      ),
      body: FutureBuilder(
        future: ApiClass().technicianOrderItems(widget.orderId),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: AppColors.orangeColor,
                ),
              ),
            );
          } else if (snapShot.hasError) {
            return const Text("Connection error...");
          } else {
            if (snapShot.hasData) {
              ItemModel itemModel = ItemModel();
              itemModel = ItemModel.fromJson(snapShot.data);
              if (itemModel.response?.isEmpty == true) {
                return const Center(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "No Order data available!",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0x0ff4e6ef),
                          border: Border.all(
                              color: const Color(0xffD6DDE5), width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 14, left: 26, right: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Customer ",
                                      style: TextStyle(
                                          color: AppColors.darkColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Text(
                                    ": ",
                                    style: TextStyle(
                                        color: AppColors.darkColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "${itemModel.response?[0].customer} ",
                                      style: TextStyle(
                                          color: AppColors.darkColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Address ",
                                      style: TextStyle(
                                          color: AppColors.darkColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Text(
                                    ": ",
                                    style: TextStyle(
                                        color: AppColors.darkColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "${itemModel.response?[0].street},${itemModel.response?[0].city},${itemModel.response?[0].state},${itemModel.response?[0].country}",
                                      style: TextStyle(
                                          color: AppColors.darkColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Phone no.",
                                      style: TextStyle(
                                          color: AppColors.darkColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Text(
                                    ": ",
                                    style: TextStyle(
                                        color: AppColors.darkColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "${itemModel.response?[0].phone}",
                                      style: TextStyle(
                                          color: AppColors.darkColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "Email ",
                                      style: TextStyle(
                                          color: AppColors.darkColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ),
                                  Text(
                                    ": ",
                                    style: TextStyle(
                                        color: AppColors.darkColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      "${itemModel.response?[0].email}",
                                      style: TextStyle(
                                          color: AppColors.darkColor
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0x0ff4e6ef),
                          border: Border.all(
                              color: const Color(0xffD6DDE5), width: 2),
                        ),
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (homePageController.currentPosition != null &&
                                  DateFormat('dd-MM-yyyy')
                                          .format(DateTime.now())
                                          .toString() ==
                                      (itemModel.response?[index]
                                              .installationDate ??
                                          "") &&
                                  (homePageController.currentPosition?.latitude
                                          .toStringAsFixed(3) ==
                                      double.parse(itemModel
                                                  .response?[index].latitude ??
                                              "0.0")
                                          .toStringAsFixed(3)) &&
                                  (homePageController.currentPosition?.longitude
                                          .toStringAsFixed(3) ==
                                      double.parse(
                                              itemModel.response?[index].longitude ?? "0.0")
                                          .toStringAsFixed(3))) {
                                itemModel.response?[index].isStart?.value =
                                    true;
                              }
                              if (itemModel.response?[index].viewByTechnician ==
                                  "False") {
                                ApiClass().viewOrder(
                                    itemModel.response?[index].orderItemId,
                                    "True");
                              }
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 26, right: 26, bottom: 10, top: 15),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${itemModel.response?[index].product ?? ""} (${itemModel.response?[index].sku ?? ""})",
                                          style: TextStyle(
                                              color: AppColors.darkColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        itemModel.response?[index]
                                                    .installationComplete !=
                                                "False"
                                            ? Chip(
                                                backgroundColor:
                                                    const Color.fromRGBO(
                                                        255, 165, 0, 0.18),
                                                label: Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Text(
                                                    "Installed",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 17),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 1),
                                          child: Text(
                                            "Installation Date :  ",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: AppColors.darkColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Text(
                                          itemModel.response?[index]
                                                  .installationDate ??
                                              "",
                                          style: TextStyle(
                                              color: AppColors.darkColor
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    if (itemModel.response?[index]
                                            .installationComplete ==
                                        "False")
                                      itemModel.response?[index].isStart
                                                  ?.value ==
                                              true
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(
                                                      minimumSize:
                                                          MaterialStateProperty
                                                              .all(
                                                        Size(Get.width * 0.38,
                                                            40),
                                                      ),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        AppColors.orangeColor,
                                                      ),
                                                    ),
                                                    onPressed: () async {
                                                      print(
                                                          "start installation : ${itemModel.response?[index].startInstalltion?.value}");
                                                      if (itemModel
                                                              .response?[index]
                                                              .startInstalltion
                                                              ?.value ==
                                                          true) {
                                                      } else {
                                                        itemModel
                                                            .response?[index]
                                                            .startInstalltion
                                                            ?.value = true;
                                                        var data = await ApiClass()
                                                            .jobStartStop(
                                                                itemModel
                                                                        .response?[
                                                                            index]
                                                                        .orderItemId ??
                                                                    "",
                                                                "start");
                                                        if (data != null) {
                                                          if (data['success'] ==
                                                              true) {
                                                            Get.snackbar(
                                                                "${data['response']}",
                                                                "");
                                                          } else {
                                                            print(
                                                                "forgotPass responce : $data");
                                                            Get.snackbar(
                                                                "${data['response']}",
                                                                "");
                                                          }
                                                        }
                                                      }
                                                    },
                                                    child: Text(
                                                      "Start".toUpperCase(),
                                                      style: const TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  Obx(
                                                    () => itemModel
                                                                .response?[
                                                                    index]
                                                                .startInstalltion
                                                                ?.value ==
                                                            true
                                                        ? Row(
                                                            children: [
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              ElevatedButton(
                                                                style:
                                                                    ButtonStyle(
                                                                  minimumSize:
                                                                      MaterialStateProperty
                                                                          .all(
                                                                    Size(
                                                                        Get.width *
                                                                            0.38,
                                                                        40),
                                                                  ),
                                                                  backgroundColor:
                                                                      MaterialStateProperty.all(
                                                                          AppColors
                                                                              .orangeColor),
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  itemModel
                                                                      .response?[
                                                                          index]
                                                                      .startInstalltion
                                                                      ?.value = false;
                                                                  await ApiClass()
                                                                      .updateInstallationStatus(
                                                                          widget
                                                                              .orderId);
                                                                  setState(
                                                                      () {});
                                                                  var data = await ApiClass()
                                                                      .jobStartStop(
                                                                          itemModel.response?[index].orderItemId ??
                                                                              "",
                                                                          "stop");
                                                                  if (data !=
                                                                      null) {
                                                                    if (data[
                                                                            'success'] ==
                                                                        true) {
                                                                      Get.snackbar(
                                                                          "${data['response']}",
                                                                          "");
                                                                    } else {
                                                                      print(
                                                                          "forgotPass responce : $data");
                                                                      Get.snackbar(
                                                                          "${data['response']}",
                                                                          "");
                                                                    }
                                                                  }
                                                                },
                                                                child: Text(
                                                                  "End"
                                                                      .toUpperCase(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : const SizedBox(),
                                                  )
                                                ],
                                              ),
                                            )
                                          : const SizedBox()
                                    else
                                      const SizedBox(),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Divider(
                                  thickness: 1,
                                  color: AppColors.lightColor.withOpacity(0.5),
                                ),
                              );
                            },
                            itemCount: itemModel.response?.length ?? 0),
                      ),
                    ),
                  ],
                );
              }
            } else {
              return const Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "No Order data available!",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
