import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/category_model/category_model.dart';
import 'package:time4deal/utils/dio.interceptors.dart';

class CategoryService {
  Future<List<CategoryModel>?> getCategories() async {
    Dio dios = await InterceptorApi().getUserApi();
    try {
      const url = AppUrls.baseUrl + ApiEndPoints.getCategory;
      final Response response = await dios.get(url);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        List<CategoryModel> categoryList = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        // log("hyyy ${categoryList.toString()}");
        return categoryList;
      }
      return null;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
