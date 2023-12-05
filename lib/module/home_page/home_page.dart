import 'package:excitech/module/home_page/view_item_details.dart';
import 'package:excitech/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/order_model.dart';
import '../../service.dart';
import 'home_page_controller.dart';
import 'navigation_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homePageController.scaffoldKey,
      drawer: ExciTechDrawer(),
      appBar: AppBar(
        title: const Text("Job"),
        centerTitle: true,
        backgroundColor: AppColors.orangeColor,
      ),
      body: FutureBuilder(
        future: ApiClass().technicianOrder(),
        builder: (context, AsyncSnapshot snapShot) {
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
            return Text("Connection error...${snapShot.error}");
          } else {
            OrderModel orderModel = OrderModel();
            if (snapShot.hasData) {
              orderModel = OrderModel.fromJson(snapShot.data);
              if (orderModel.response?.isEmpty == true) {
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
                return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    itemBuilder: (context, index) {
                      List<String> newName = orderModel
                              .response?[index].customer
                              .toString()
                              .split("") ??
                          [];

                      return InkWell(
                        onTap: () {
                          Get.to(ViewOrderDetails(
                            cusomerName: orderModel.response?[index].customer,
                            orderId: orderModel.response?[index].orderId,
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 15, bottom: 15),
                                          child: Container(
                                            width: 6,
                                            height: 110,
                                            color: AppColors.orangeColor,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 10, bottom: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "JOB ID #: ${orderModel.response?[index].orderId ?? ""} ",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: AppColors.darkColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Text(
                                                  orderModel.response?[index]
                                                          .installationDate ??
                                                      "",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.lightColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Text(
                                                  orderModel.response?[index]
                                                          .installationTime ??
                                                      "00:00:00",
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.lightColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 0,
                                              ),
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          AppColors
                                                              .orangeColor),
                                                ),
                                                onPressed: () {
                                                  homePageController
                                                      .dateController
                                                      .text = orderModel
                                                          .response?[index]
                                                          .installationDate ??
                                                      "";
                                                  print(
                                                      "time : ${orderModel.response?[index].installationTime ?? ""}");
                                                  if (orderModel
                                                              .response?[index]
                                                              .installationTime !=
                                                          "" &&
                                                      orderModel
                                                              .response?[index]
                                                              .installationTime !=
                                                          null) {
                                                    homePageController
                                                        .selectedTime
                                                        .value = orderModel
                                                            .response?[index]
                                                            .installationTime ??
                                                        "";
                                                  }
                                                  updateDateDialog(
                                                    context,
                                                    orderModel.response?[index]
                                                            .orderId ??
                                                        "",
                                                    orderModel.response?[index]
                                                            .installationDate ??
                                                        "",
                                                    orderModel.response?[index]
                                                        .customer,
                                                  );
                                                },
                                                child: Text(
                                                  "Update".toUpperCase(),
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.pink,
                                          child: Text(
                                            newName[0],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                            orderModel.response?[index]
                                                    .customer ??
                                                "",
                                            style: TextStyle(
                                                color: AppColors.lightColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: orderModel.response?.length ?? 0);
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

  updateDateDialog(context, itemId, date, name) {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Update Installation Date',
              style: TextStyle(
                  color: AppColors.darkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
          ),
          content: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(top: 10),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         "Installation Date :   ",
                //         overflow: TextOverflow.ellipsis,
                //         style: TextStyle(
                //             color: AppColors.darkColor,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20),
                //       ),
                //       Expanded(
                //         child: Text(date,
                //             style: TextStyle(
                //                 color: AppColors.lightColor,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20)),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Customer : ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Expanded(
                        child: Text(name,
                            style: TextStyle(
                                color: AppColors.lightColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Text(
                        "Installation Date",
                        style: TextStyle(
                            color: AppColors.darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                TextField(
                  controller: homePageController.dateController,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {},
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2075))
                        .then((pickedDate) {
                      if (pickedDate != null && pickedDate != DateTime.now()) {
                        String selectedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        homePageController.dateController.text = selectedDate;
                      }
                    });
                  },
                  decoration: InputDecoration(
                    suffixIconConstraints:
                        const BoxConstraints(maxWidth: 15, maxHeight: 15),
                    suffixIcon: InkWell(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2075))
                            .then((pickedDate) {
                          if (pickedDate != null &&
                              pickedDate != DateTime.now()) {
                            String selectedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            homePageController.dateController.text =
                                selectedDate;
                          }
                        });
                      },
                      child: Icon(
                        Icons.date_range,
                        color: AppColors.darkColor,
                      ),
                    ),
                    suffixIconColor: AppColors.lightColor,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightColor),
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    hintText: date,
                    hintStyle: TextStyle(
                      color: Theme.of(context).focusColor.withOpacity(0.7),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Text("Installation Time",
                          style: TextStyle(
                              color: AppColors.darkColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      // Container(
                      //   margin: const EdgeInsets.only(left: 4),
                      //   padding: const EdgeInsets.all(1.0),
                      //   child: const Text(
                      //     '*',
                      //     style: TextStyle(color: Colors.red, fontSize: 20),
                      //   ),
                      // )
                    ],
                  ),
                ),
                DropdownButtonFormField(
                    value: homePageController.selectedTime.value,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightColor),
                      ),
                      contentPadding: const EdgeInsets.all(0),
                      hintText: "Enter Comment",
                      hintStyle: TextStyle(
                        color: Theme.of(context).focusColor.withOpacity(0.7),
                      ),
                    ),
                    items: homePageController.timeSlot.map((item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),
                    onChanged: (value) {
                      homePageController.selectedTime.value = value.toString();
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Text("Comment : ",
                          style: TextStyle(
                              color: AppColors.darkColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        padding: const EdgeInsets.all(1.0),
                        child: const Text(
                          '*',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                TextField(
                  controller: homePageController.commentController,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightColor),
                    ),
                    contentPadding: const EdgeInsets.all(0),
                    hintText: "Enter Comment",
                    hintStyle: TextStyle(
                      color: Theme.of(context).focusColor.withOpacity(0.7),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.darkColor)),
                        child: const Text('Close'),
                        onPressed: () {
                          homePageController.commentController.clear();
                          Get.back();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.orangeColor)),
                        child: const Text('Save Changes'),
                        onPressed: () async {
                          if (homePageController
                              .commentController.text.isNotEmpty) {
                            var data = await ApiClass().installtionDateUpdate(
                                itemId,
                                homePageController.dateController.text,
                                homePageController.commentController.text,
                                homePageController.selectedTime.value);
                            if (data != null) {
                              if (data['success'] == true) {
                                Get.back();
                                homePageController.dateController.clear();
                                homePageController.commentController.clear();
                                setState(() {});
                              } else {
                                print("forgotPass responce : $data");
                                Get.snackbar("${data['messages']}", "");
                              }
                            }
                          } else {
                            Get.snackbar("Comment required", "");
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
