import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/product_model/product_model.dart';
import 'package:time4deal/utils/dio.interceptors.dart';

class ProductDetailsScreenService {
  Future<ProductModel?> getAProduct(String productId) async {
    Dio dios = await InterceptorApi().getUserApi();
    log('product id:$productId');

    try {
      final String url =
          '${AppUrls.baseUrl}${ApiEndPoints.getProducts}/$productId';
      log('entered getAProduct function');
      final Response response = await dios.get(url);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('entered here');
        ProductModel productModel = ProductModel.fromJson(response.data);
        log(productModel.name.toString());

        return productModel;
      }
      return null;
    } catch (e) {
      log(e.toString());
      AppExceptions.handleError(e);
    }

    return null;
  }
}
