import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

String header = "application/json";
const content = "application/x-www-form-urlencoded";

class HttpClientService {
  static Future<http.Response?> getRequest([
    String? url,
    String? token,
  ]) async {
    http.Response? response;

    log("This is the http client service url: $url");

    try {
      response = await http.get(
        Uri.parse(url!),
        headers: {
          HttpHeaders.contentTypeHeader: header,
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      log("This is the http client service response body: ${response.statusCode}");
    } catch (e) {
      response = null;
      log(e.toString());
    }
    return response;
  }

  static Future<http.Response?> postRequest([
    String? url,
    String? token,
    dynamic data,
  ]) async {
    http.Response? response;
    try {
      if (token == null) {
        response = await http
            .post(
              Uri.parse(url!),
              headers: {
                HttpHeaders.contentTypeHeader: header,
                "Content-Type": content,
              },
              body: data,
            )
            .timeout(const Duration(seconds: 20));
      } else {
        response = await http
            .post(
              Uri.parse(url!),
              headers: {
                HttpHeaders.contentTypeHeader: header,
                "Content-Type": content,
                HttpHeaders.authorizationHeader: "Bearer $token",
              },
              body: jsonEncode(data),
            )
            .timeout(const Duration(seconds: 20));

        log(response.body);
      }
    } catch (e) {
      response = null;
      log(e.toString());
    }
    return response;
  }

  static Future<http.Response?> putRequest([
    String? url,
    String? token,
    dynamic data,
  ]) async {
    http.Response? response;
    try {
      log("This is the http client service data: $data");

      response = await http
          .put(
            Uri.parse(url!),
            headers: {
              HttpHeaders.contentTypeHeader: header,
              "Content-Type": content,
              HttpHeaders.authorizationHeader: "Bearer $token",
            },
            body: data,
          )
          .timeout(const Duration(seconds: 20));
      log("This is the http client service response body: ${response.body}");
    } catch (e) {
      response = null;
      log(e.toString());
    }
    return response;
  }

  static Future<http.StreamedResponse?> uploadProfilePicture(
    String url,
    String token,
    XFile file,
  ) async {
    http.StreamedResponse? response;
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        HttpHeaders.authorizationHeader: "Bearer $token",
        HttpHeaders.contentTypeHeader: "multipart/form-data",
      });

      // Add the file to the request
      request.files.add(await http.MultipartFile.fromPath(
        'profile_image', // field name for the file
        file.path,
        contentType: MediaType('image', 'jpeg'),
      ));

      log("Uploading profile image: ${file.path}");

      response = await request.send().timeout(const Duration(seconds: 20));

      log("Response status code: ${response.statusCode}");
    } catch (e) {
      response = null;
      log("Error uploading profile image: $e");
    }
    return response;
  }

  static Future<http.Response?> updateProfile({
    required String url,
    required String token,
    XFile? profileImage,
    String? businessName,
    String? address,
    String? phone,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add the authorization token
      request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';

      // Add the text fields
      // if (userName != null) {
      if (businessName != null) {
        // request.fields['user_name'] = userName;
        request.fields['business_name'] = businessName;
      }
      if (address != null) {
        request.fields['address'] = address;
      }
      if (phone != null) {
        request.fields['phone'] = phone;
      }

      // Add the profile image file if provided
      if (profileImage != null) {
        var stream = http.ByteStream(profileImage.openRead());
        var length = await profileImage.length();
        var multipartFile = http.MultipartFile(
          'profile_image', // The key for the image field
          stream,
          length,
          filename: basename(profileImage.path),
          contentType: MediaType(
            'image',
            'jpeg',
          ), // Or 'png', depending on the file type
        );
        request.files.add(multipartFile);
      }

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      log("This is the response body ===> ${response.body}");

      return response;
    } catch (e) {
      log("Error occurred: $e");
      return null;
    }
  }
}
