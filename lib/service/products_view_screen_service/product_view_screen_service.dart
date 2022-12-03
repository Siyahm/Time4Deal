import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/product_model/product_model.dart';
import 'package:time4deal/utils/dio.interceptors.dart';

class ProductViewScreenService {
  Future<List<ProductModel>?> getProduct() async {
    Dio dios = await InterceptorApi().getUserApi();
    try {
      const url = AppUrls.baseUrl + ApiEndPoints.getProducts;
      final Response response = await dios.get(url);
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        List<ProductModel> list = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        return list;
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<List<ProductModel>?> getCategoryProduct(String categoryId) async {
    Dio dios = await InterceptorApi().getUserApi();
    try {
      final String url =
          AppUrls.baseUrl + ApiEndPoints.categoryProducts + categoryId;
      final Response response = await dios.get(url);
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final List<ProductModel> list = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        //log(list.toString());
        return list;
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
