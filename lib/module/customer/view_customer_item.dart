import 'package:excitech/module/home_page/home_page_controller.dart';
import 'package:excitech/module/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resource/color.dart';
import '../../service.dart';
import 'customer_controller.dart';

class ViewCustomerOrderItem extends StatefulWidget {
  ViewCustomerOrderItem({super.key, this.orderId});
  var orderId;
  @override
  State<ViewCustomerOrderItem> createState() => _ViewOrderDetailsState();
}

class _ViewOrderDetailsState extends State<ViewCustomerOrderItem> {
  HomePageController homePageController = Get.put(HomePageController());
  CustomerController customerController = Get.put(CustomerController());
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: AppColors.orangeColor,
      ),
      body: FutureBuilder(
        future: ApiClass().customerOrderItems(widget.orderId),
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapShot) {
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
              if (snapShot.data?['response']?.isEmpty == true) {
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
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 15, bottom: 15, right: 15),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello, ${loginController.userName.value}!",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkColor,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Thank you for your order!",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkColor.withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0x0ff4e6ef),
                              border: Border.all(
                                  color: const Color(0xffD6DDE5), width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  // Align(
                                  //   child: Chip(
                                  //     backgroundColor: const Color(0xff3e008014),
                                  //     label: Padding(
                                  //       padding: const EdgeInsets.all(4.0),
                                  //       child: Text(
                                  //         snapShot.data?['response']?[index]
                                  //                 ['get_status'] ??
                                  //             "",
                                  //         overflow: TextOverflow.ellipsis,
                                  //         style: TextStyle(
                                  //             color: AppColors.darkColor,
                                  //             fontWeight: FontWeight.w600,
                                  //             fontSize: 16),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Product:",
                                          style: TextStyle(
                                              color: AppColors.darkColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${snapShot.data?['response']?[index]['product']['product_name'] ?? ""} (${snapShot.data?['response']?[index]['product']['sku'] ?? ""})",
                                          style: TextStyle(
                                              color: AppColors.darkColor
                                                  .withOpacity(0.5),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  snapShot.data?['response']?[index]
                                                  ['installation_complete']
                                              .toString() ==
                                          "false"
                                      ? Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Ordered On :",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Text(
                                                    snapShot.data?['response']
                                                                ?[index]
                                                            ['order_date'] ??
                                                        "",
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .darkColor
                                                            .withOpacity(0.5),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Status :",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Chip(
                                                    backgroundColor: snapShot.data?['response']
                                                                    ?[index][
                                                                'get_status'] ==
                                                            "Installed"
                                                        ? const Color.fromRGBO(
                                                            255, 165, 0, 0.18)
                                                        : snapShot.data?['response']?[index]['get_status'] ==
                                                                "Arrived"
                                                            ? const Color.fromRGBO(
                                                                119, 173, 119, 0.16)
                                                            : snapShot.data?['response']?[index]['get_status'] ==
                                                                    "Shipped"
                                                                ? const Color.fromRGBO(
                                                                    62, 151, 255, 0.15)
                                                                : snapShot.data?['response']?[index]
                                                                            ['get_status'] ==
                                                                        "Ordered"
                                                                    ? const Color.fromRGBO(255, 229, 134, 1)
                                                                    : const Color.fromRGBO(100, 16, 140, 0.18),
                                                    label: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        snapShot.data?['response']
                                                                    ?[index][
                                                                'get_status'] ??
                                                            "",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .darkColor,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      // Padding(
                                      //         padding: const EdgeInsets.only(top: 10),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.start,
                                      //           children: [
                                      //             Container(
                                      //               color: AppColors.orangeColor,
                                      //               child: Card(
                                      //                 child: Padding(
                                      //                   padding:
                                      //                       const EdgeInsets.all(8.0),
                                      //                   child: Text(
                                      //                     "Installation Remaining",
                                      //                     overflow:
                                      //                         TextOverflow.ellipsis,
                                      //                     style: TextStyle(
                                      //                         color: AppColors
                                      //                             .darkColor
                                      //                             .withOpacity(0.8),
                                      //                         fontWeight:
                                      //                             FontWeight.w600,
                                      //                         fontSize: 20),
                                      //                   ),
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Installed On :",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: AppColors.darkColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                snapShot.data?['response']
                                                            ?[index]
                                                        ['installation_date'] ??
                                                    "Installation Date",
                                                style: TextStyle(
                                                    color: AppColors.darkColor
                                                        .withOpacity(0.5),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                  snapShot.data?['response']?[index]
                                                  ['installation_complete']
                                              .toString() !=
                                          "false"
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Warranty expiry : ",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: AppColors.darkColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                snapShot.data?['response']
                                                        ?[index]
                                                    ['warranty_end_date'],
                                                style: TextStyle(
                                                    color: AppColors.darkColor
                                                        .withOpacity(0.5),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox(),
                                  snapShot.data?['response']?[index]
                                                  ['installation_complete']
                                              .toString() !=
                                          "false"
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  customerController.riseRequest(
                                                      snapShot.data?['response']
                                                                  ?[index][
                                                              'order_item_id'] ??
                                                          "");
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: AppColors
                                                          .orangeColor),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            13.0),
                                                    child: Text(
                                                      snapShot.data?['response']
                                                                      ?[index][
                                                                      'installation_complete']
                                                                  .toString() !=
                                                              "false"
                                                          ? "Log issue"
                                                              .toUpperCase()
                                                          : "Log service request"
                                                              .toUpperCase(),
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: snapShot.data?['response']?.length ?? 0,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                      )
                    ],
                  ),
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
