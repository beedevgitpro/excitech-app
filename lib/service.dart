import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:excitech/resource/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getT;
import 'package:shared_preferences/shared_preferences.dart';

import 'module/login/login_controller.dart';

class ApiClass {
  FutureOr<dynamic> loginApi(email, password) async {
    LoginController loginController = getT.Get.put(LoginController());
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}technician-login/';
      print("Login URL::$url");

      Map<String, dynamic> mappp = {
        "email": email,
        "password": password,
      };
      print("save_service_cost_item ::: $mappp::");
      FormData formData = FormData.fromMap(mappp);
      final response = await Dio().post(url,
          data: formData,
          options: Options(headers: {
            "Accept": "application/json",
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        var decodedResponse = response.data;
        print("login api responce : $decodedResponse");
        await prefs.setString("user_token", decodedResponse['access']);
        await prefs.setString("user_name", decodedResponse['username']);
        await prefs.setInt("role", decodedResponse['role']);
        loginController.userName.value = decodedResponse['username'];
        print("new token : ${prefs.getString('user_token')}");

        return decodedResponse;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
    } on DioException catch (e) {
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);

      print("DioError:${e.response}");
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
    }
  }

  Future<dynamic> technicianOrder() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}technician-assigned-orders/';
      print(
          "technician order URL::$url :: token : ${prefs.getString('user_token')}");

      final response = await Dio().get(url,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      print("technician order api responce : ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
    }
  }

  Future<dynamic> customerOrders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}customer-orders/';
      print(
          "technician order URL::$url :: token : ${prefs.getString('user_token')}");

      final response = await Dio().get(url,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      print("technician order api responce : ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
    }
  }

  Future technicianOrderItems(id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}technician-assigned-order-items/$id/';
      print(
          "technician order URL::$url :: token : ${prefs.getString('user_token')}");

      final response = await Dio().get(url,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      print("technician order api responce : ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
    }
  }

  Future<Map<String, dynamic>> customerOrderItems(id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}customer-order-items/$id/';
      print(
          "technician order URL::$url :: token : ${prefs.getString('user_token')}");

      final response = await Dio().get(url,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      print("technician order api responce : ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
        return {};
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
      return {};
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
      return {};
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
      return {};
    }
  }

  FutureOr<dynamic> installtionDateUpdate(itemId, date, comment, time) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url =
          '${AppText.baseUrl}technician-update-item-installation-date/$itemId/';
      print(
          "technician order URL::$url :: token : ${prefs.getString('user_token')}");
      Map<String, dynamic> mappp = {
        "installation_date": date,
        "installation_time": time,
        "comment": comment,
      };
      print("technician-update-item-installation-date:: $mappp::");
      FormData formData = FormData.fromMap(mappp);
      final response = await Dio().post(url,
          data: formData,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      var decodedResponse = response.data;
      print("technician-update-item-installation-date: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
    }
  }

  FutureOr<dynamic> serviceRequest(
      itemId, comment, List<String> imageFile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}customer-service-request/$itemId/';
      print(
          "technician order URL::$url :: token : ${prefs.getString('user_token')}");
      List<MultipartFile> imagesp = <MultipartFile>[];
      for (var i = 0; i < imageFile.length; i++) {
        MultipartFile s = await MultipartFile.fromFile(imageFile[i],
            filename: imageFile[i].split('/').last);
        imagesp.add(s);
        print(imagesp[i]);
      }
      Map<String, dynamic> mappp = {
        "service_request_image": imagesp,
        "comment": comment,
      };
      print("technician-update-item-installation-date:: $mappp::");
      FormData formData = FormData.fromMap(mappp);
      final response = await Dio().post(url,
          data: formData,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      var decodedResponse = response.data;
      print("technician-update-item-installation-date: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
    }
  }

  FutureOr<dynamic> jobStartStop(itemId, action) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}technician-job-start-stop/$itemId/';
      print(
          "technician-job-start-stopL::$url :: token : ${prefs.getString('user_token')}");
      Map<String, dynamic> mappp = {
        "action": action,
      };
      print("technician-job-start-stop:: $mappp::");
      FormData formData = FormData.fromMap(mappp);
      final response = await Dio().put(url,
          data: formData,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      var decodedResponse = response.data;
      print("technician-job-start-stop: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
    }
  }

  FutureOr<dynamic> updateInstallationStatus(itemId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url =
          '${AppText.baseUrl}technician-update-installation-status/$itemId/';
      print("technician-update-installation-status::$url ::}");
      Map<String, dynamic> mappp = {
        "installation_complete": "True",
      };
      print("technician-update-item-installation-date:: $mappp::");
      FormData formData = FormData.fromMap(mappp);
      final response = await Dio().put(url,
          data: formData,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      var decodedResponse = response.data;
      print("technician-update-installation-status: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
    }
  }

  FutureOr<dynamic> viewOrder(itemId, action) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}technician-view-order-item/$itemId/';
      print(
          "ttechnician-view-order-item:$url :: token : ${prefs.getString('user_token')}");
      Map<String, dynamic> mappp = {
        "view_by_technician": action,
      };
      print("technician-job-start-stop:: $mappp::");
      FormData formData = FormData.fromMap(mappp);

      final response = await Dio().put(url,
          data: formData,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      var decodedResponse = response.data;
      print("technician-view-order-item: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
    }
  }

  Future<Map<String, dynamic>> warrantyOrderList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}customer-warranty-order-list/';
      print(
          "customer-warranty-order-list:$url :: token : ${prefs.getString('user_token')}");

      final response = await Dio().get(url,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      var decodedResponse = response.data;
      print("customer-warranty-order-list: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
        return {};
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
      return {};
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
      return {};
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
      return {};
    }
  }

  Future<Map<String, dynamic>> serviceOrderList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}customer-service-order-list/';
      print(
          "customer-service-order-list:$url :: token : ${prefs.getString('user_token')}");

      final response = await Dio().get(url,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      var decodedResponse = response.data;
      print("customer-service-order-list: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
        return {};
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
      return {};
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
      return {};
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
      return {};
    }
  }

  FutureOr<dynamic> forgotPassword(email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}technician-forgot-password/';
      print(
          "technician forgot password URL::$url :: token : ${prefs.getString('user_token')}");
      Map<String, dynamic> mappp = {
        "email": email,
      };
      print("forgot password:: $mappp::");
      FormData formData = FormData.fromMap(mappp);

      final response = await Dio().post(url,
          data: formData,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      var decodedResponse = response.data;
      print("technician-update-item-installation-date: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
    }
  }

  FutureOr<dynamic> resetPassword(newPassword, confirmPassword) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = '${AppText.baseUrl}technician-reset-password/';
      print(
          "technician-reset-password URL::$url :: token : ${prefs.getString('user_token')}");
      Map<String, dynamic> mappp = {
        "new_password": newPassword,
        "confirm_password": confirmPassword,
      };
      print("technician-reset-password:: $mappp::");
      FormData formData = FormData.fromMap(mappp);
      final response = await Dio().put(url,
          data: formData,
          options: Options(headers: {
            "Content-type": "application/json",
            'Authorization': 'Bearer ${prefs.getString('user_token')}'
          }));
      var decodedResponse = response.data;
      print("technician-reset-password: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        getT.Get.snackbar("Error status code", '${response.statusCode}',
            backgroundColor: Colors.red);
      }
    } on TimeoutException catch (_) {
      getT.Get.snackbar("No Internet Connection", '',
          backgroundColor: Colors.red);
    } on SocketException catch (e) {
      print(e);
      getT.Get.snackbar("No Internet Connection $e", '',
          backgroundColor: Colors.red);
    } on Exception catch (e) {
      print("Error : $e");
      getT.Get.snackbar("Error:$e", '', backgroundColor: Colors.red);
    }
  }
}
