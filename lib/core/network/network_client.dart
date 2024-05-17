import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:template_project/core/constants/strings.dart';
import 'package:template_project/core/constants/urls.dart';
import 'package:template_project/core/helper/snack_bar.dart';

class NetworkClient {
  static Future<dynamic> getData({
    required String apiEndPoint,
    dynamic queryParameters,
  }) async {
    // String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    // String url = ConstantStrings.kBaseUrl + apiV + api;
    String url = NetworkUrls.baseUrl + apiEndPoint;
    try {
      var response = await Dio().get(
        url,
        options: Options(
          headers: getGitHubHeader(),
            contentType: "application/x-www-form-urlencoded"
        ),
        queryParameters: queryParameters,
      );

      if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception();
      }
      print('GET Method: ${response.statusCode}');
      print(url);
      log("GET Response:  ${jsonEncode(response.data)}");
      return response.data;
    } catch (e) {
      print(e.toString());
      HelperMethods.showSnackBar(
        message: AppStrings.wentWrong,
      );
    }
  }

  static Map<String, dynamic> getGitHubHeader() {
    return {
      'Authorization': 'Bearer ${AppStrings.token}',
      "Accept":"application/vnd.github+json",
      "X-GitHub-Api-Version": "2022-11-28",
    };
  }
}
