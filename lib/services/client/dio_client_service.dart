import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stellar/controllers/others/api_processor_controller.dart';

String contentType = "application/json";

final dio = Dio();

class DioClientService {
  static Future<Response?> postRequest(String url, Object data) async {
    Response? response;
    try {
      response = await dio.postUri(
        Uri.parse(url),
        data: data,
        options: Options(
          contentType: contentType,
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          persistentConnection: true,
          receiveDataWhenStatusError: true,
        ),
      );
    } on SocketException {
      ApiProcessorController.warningSnack("Please connect to the internet");
      return null;
    } on DioException catch (e) {
      // Handle Dio exceptions

      // The request was made but there was no internet connection on the device
      if (e.message!.contains("The connection errored: Failed host lookup:")) {
        log("Dio Request Options Error: ${e.requestOptions}");
        log("Dio Error Message: ${e.message}");
        ApiProcessorController.warningSnack("Please connect to the internet");
      }
      // The request was made but there was no error message
      else if (e.message == null) {
        log("Dio Request Options Error: ${e.requestOptions}");
        log("Dio Error Message: ${e.message}");
        ApiProcessorController.warningSnack(
          "Please check your internet connection",
        );
      }
      return null; // Return null in the catch block if an exception occurs
    } catch (e) {
      log(e.toString());
      return null;
    }
    return response; // Return the response in the try block
  }

  static Future<Response?> getRequest(String url,
      {Object? data, String? token}) async {
    Response? response;
    try {
      response = await dio.getUri(
        Uri.parse(url),
        data: data,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
          contentType: contentType,
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
          persistentConnection: true,
          receiveDataWhenStatusError: true,
        ),
      );
      log(response.data);
    } on SocketException {
      ApiProcessorController.warningSnack("Please connect to the internet");
      return null;
    } on DioException catch (e) {
      // Handle Dio exceptions

      // The request was made but there was no internet connection on the device
      if (e.message!.contains("The connection errored: Failed host lookup:")) {
        log("Dio Request Options Error: ${e.requestOptions}");
        log("Dio Error Message: ${e.message}");
        ApiProcessorController.warningSnack("Please connect to the internet");
      }
      // The request was made but there was no error message
      else if (e.message == null) {
        log("Dio Request Options Error: ${e.requestOptions}");
        log("Dio Error Message: ${e.message}");
        ApiProcessorController.warningSnack(
            "Please check your internet connection");
      }
      return null; // Return null in the catch block if an exception occurs
    } catch (e) {
      log(e.toString());
      return null;
    }
    return response; // Return the response in the try block
  }
}
