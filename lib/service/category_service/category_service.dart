import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';
import 'package:time4deal/models/category_model/category_model.dart';

class CategoryService {
  Future<List<CategoryModel>?> getCategories() async {
    try {
      const url = AppUrls.mainUrl + ApiEndPoints.getCategory;
      final Response response = await Dio().get(url);
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
