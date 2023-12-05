import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  Position? currentPosition;
  RxString selectedTime = "00:00:00".obs;
  // List timeSlot = [
  //   '00:00 AM',
  //   '00:30 AM',
  //   '01:00 AM',
  //   '01:30 AM',
  //   '02:00 AM',
  //   '02:30 AM',
  //   '03:00 AM',
  //   '03:30 AM',
  //   '04:00 AM',
  //   '04:30 AM',
  //   '05:00 AM',
  //   '05:30 AM',
  //   '06:00 AM',
  //   '06:30 AM',
  //   '07:00 AM',
  //   '07:30 AM',
  //   '08:00 AM',
  //   '08:30 AM',
  //   '09:00 AM',
  //   '09:30 AM',
  //   '10:00 AM',
  //   '10:30 AM',
  //   '11:00 AM',
  //   '11:30 AM',
  //   '12:00 PM',
  //   '12:30 PM',
  //   '01:00 PM',
  //   '01:30 PM',
  //   '02:00 PM',
  //   '02:30 PM',
  //   '03:00 PM',
  //   '03:30 PM',
  //   '04:00 PM',
  //   '04:30 PM',
  //   '05:00 PM',
  //   '05:30 PM',
  //   '06:00 PM',
  //   '06:30 PM',
  //   '07:00 PM',
  //   '07:30 PM',
  //   '08:00 PM',
  //   '08:30 PM',
  //   '09:00 PM',
  //   '09:30 PM',
  //   '10:00 PM',
  //   '10:30 PM',
  //   '11:00 PM',
  //   '11:30 PM',
  // ];
  List timeSlot = [
    '00:00:00',
    '00:30:00',
    '01:00:00',
    '01:30:00',
    '02:00:00',
    '02:30:00',
    '03:00:00',
    '03:30:00',
    '04:00:00',
    '04:30:00',
    '05:00:00',
    '05:30:00',
    '06:00:00',
    '06:30:00',
    '07:00:00',
    '07:30:00',
    '08:00:00',
    '08:30:00',
    '09:00:00',
    '09:30:00',
    '10:00:00',
    '10:30:00',
    '11:00:00',
    '11:30:00',
    '12:00:00',
    '12:30:00',
    '13:00:00',
    '13:30:00',
    '14:00:00',
    '14:30:00',
    '15:00:00',
    '15:30:00',
    '16:00:00',
    '16:30:00',
    '17:00:00',
    '17:30:00',
    '18:00:00',
    '18:30:00',
    '19:00:00',
    '19:30:00',
    '20:00:00',
    '20:30:00',
    '21:00:00',
    '21:30:00',
    '22:00:00',
    '22:30:00',
    '23:00:00',
    '23:30:00',
  ];

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      print("current position : ${currentPosition}");
    }).catchError((e) {
      debugPrint(e);
    });
  }

  getLocation() async {
    await getCurrentPosition();
  }

  @override
  void onInit() {
    getLocation();
    // TODO: implement onInit
    super.onInit();
  }
}
