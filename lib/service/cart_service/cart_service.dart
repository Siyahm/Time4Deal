import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/cart_model/cart_get_model.dart';
import 'package:time4deal/models/cart_model/cart_post_model.dart';
import 'package:time4deal/utils/dio.interceptors.dart';

class CartService {
  Future<String?> addToCart(CartPostModel cartPostModel) async {
    Dio dios = await InterceptorApi().getUserApi();
    try {
      const url = AppUrls.baseUrl + ApiEndPoints.cart;

      Response response = await dios.post(
        url,
        data: cartPostModel.toJson(),
      );
      log('add cart service called');
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        log(response.data.toString());
        return response.data["message"].toString();
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<CartGetModel?> getCartItems() async {
    Dio dios = await InterceptorApi().getUserApi();
    try {
      const url = AppUrls.baseUrl + ApiEndPoints.cart;
      final Response response = await dios.get(url);
      if (response.statusCode == 200) {
        return CartGetModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<String?> removeCartItem(String itemId) async {
    log('it s remove service');
    Dio dios = await InterceptorApi().getUserApi();
    try {
      log('remove try');
      const url = AppUrls.baseUrl + ApiEndPoints.cart;
      final Response response = await dios.patch(
        url,
        data: {
          'product': itemId,
        },
      );
      log('got here');
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        return response.data["message"].toString();
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
