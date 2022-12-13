import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/wish_list_model/wish_list_model.dart';
import 'package:time4deal/utils/dio.interceptors.dart';

class WishListServices {
  Future<String?> addToWishList(String productId) async {
    Dio dios = await InterceptorApi().getUserApi();
    try {
      const url = AppUrls.baseUrl + ApiEndPoints.addOrGetWishList;
      final Response response =
          await dios.post(url, data: {"product": productId});
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        String message = response.data;
        return message;
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<WishListModel?> getWishList() async {
    Dio dios = await InterceptorApi().getUserApi();
    try {
      const url = AppUrls.baseUrl + ApiEndPoints.addOrGetWishList;
      final Response response = await dios.get(url);
      if (response.statusCode == 200) {
        return WishListModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
