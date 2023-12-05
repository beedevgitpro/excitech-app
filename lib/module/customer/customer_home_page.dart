import 'package:excitech/module/customer/view_customer_item.dart';
import 'package:excitech/module/home_page/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resource/color.dart';
import '../../service.dart';
import '../home_page/navigation_drawer.dart';

class CustomerHomePage extends StatelessWidget {
  CustomerHomePage({super.key});
  HomePageController homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homePageController.scaffoldKey,
      drawer: ExciTechDrawer(),
      appBar: AppBar(
        title: const Text("Order"),
        centerTitle: true,
        backgroundColor: AppColors.orangeColor,
      ),
      body: FutureBuilder(
        future: ApiClass().customerOrders(),
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
            if (snapShot.hasData) {
              if (snapShot.data['response']?.isEmpty == true) {
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
                      // List<String> newName = snapShot.data['response']?[index].customer
                      //         .toString()
                      //         .split("") ??
                      //     [];

                      return InkWell(
                        onTap: () {
                          Get.to(ViewCustomerOrderItem(
                            orderId: snapShot.data['response']?[index]
                                ['order_id'],
                          ));
                          // Get.to(ViewOrderDetails(
                          //   cusomerName: snapShot.data['response']?[index].customer,
                          //   orderId: snapShot.data['response']?[index].orderId,
                          // ));
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
                                            height: 80,
                                            color: AppColors.orangeColor,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Column(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 4),
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: "ORDER : ",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            "#${snapShot.data['response']?[index]['order_id'] ?? ""}",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .orangeColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, top: 5),
                                              child: Text(
                                                  snapShot.data['response']
                                                              ?[index]
                                                          ['order_date'] ??
                                                      "",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color:
                                                          AppColors.lightColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.only(
                                            //     top: 5,
                                            //   ),
                                            //   child: ElevatedButton(
                                            //     style: ButtonStyle(
                                            //       backgroundColor:
                                            //           MaterialStateProperty.all(
                                            //               AppColors
                                            //                   .orangeColor),
                                            //     ),
                                            //     onPressed: () {
                                            //       homePageController
                                            //           .dateController
                                            //           .text = snapShot
                                            //               .data['response']
                                            //                   ?[index]
                                            //               .installationDate ??
                                            //           "";
                                            //       // updateDateDialog(
                                            //       //   context,
                                            //       //   snapShot.data['response']?[index]
                                            //       //           .orderId ??
                                            //       //       "",
                                            //       //   snapShot.data['response']?[index]
                                            //       //           .installationDate ??
                                            //       //       "",
                                            //       //   snapShot.data['response']?[index]
                                            //       //       .customer,
                                            //       // );
                                            //     },
                                            //     child: Text(
                                            //       "Update".toUpperCase(),
                                            //       style: const TextStyle(
                                            //           fontSize: 18),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            "\$ ${snapShot.data['response']?[index]['total_price'] ?? ""}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: AppColors.darkColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        Chip(
                                          backgroundColor: snapShot.data['response']
                                                          ?[index]
                                                      ['order_status'] ==
                                                  "Installed"
                                              ? const Color.fromRGBO(
                                                  255, 165, 0, 0.18)
                                              : snapShot.data['response']
                                                              ?[index]
                                                          ['order_status'] ==
                                                      "Arrived"
                                                  ? const Color.fromRGBO(
                                                      119, 173, 119, 0.16)
                                                  : snapShot.data['response']?[index]['order_status'] ==
                                                          "Shipped"
                                                      ? const Color.fromRGBO(
                                                          62, 151, 255, 0.15)
                                                      : snapShot.data['response']
                                                                      ?[index]
                                                                  ['order_status'] ==
                                                              "Ordered"
                                                          ? const Color.fromRGBO(255, 229, 134, 1)
                                                          : const Color.fromRGBO(100, 16, 140, 0.18),
                                          label: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              snapShot.data['response']?[index]
                                                      ['order_status'] ??
                                                  "",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: AppColors.darkColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       right: 10, top: 10),
                                  //   child: Column(
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.end,
                                  //     children: [
                                  //       CircleAvatar(
                                  //         radius: 25,
                                  //         backgroundColor: Colors.pink,
                                  //         child: Text(
                                  //           newName[0],
                                  //           style: const TextStyle(
                                  //               color: Colors.white,
                                  //               fontWeight: FontWeight.bold,
                                  //               fontSize: 20),
                                  //         ),
                                  //       ),
                                  //       const SizedBox(
                                  //         height: 4,
                                  //       ),
                                  //       Text(
                                  //           snapShot.data['response']?[index]
                                  //                   .customer ??
                                  //               "",
                                  //           style: TextStyle(
                                  //               color: AppColors.lightColor,
                                  //               fontWeight: FontWeight.bold,
                                  //               fontSize: 20)),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: snapShot.data['response']?.length ?? 0);
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
