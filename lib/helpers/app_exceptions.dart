import 'package:dio/dio.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_colors.dart';
import 'package:time4deal/utils/app_utils.dart';
import 'package:time4deal/utils/custom_toast.dart';

class AppExceptions {
  static void handleError(Object e) {
    if (e is DioError) {
      if (e.type == DioErrorType.cancel) {
        customToast('Request Cancelled', AppColors.redColor);
      } else if (e.type == DioErrorType.connectTimeout) {
        customToast('Connection Time out', AppColors.redColor);
      } else if (e.type == DioErrorType.receiveTimeout) {
        customToast('Receiver Time out', AppColors.redColor);
      } else if (e.type == DioErrorType.response) {
        customToast('Response Error', AppColors.redColor);
      } else if (e.type == DioErrorType.sendTimeout) {
        customToast('Send Time out', AppColors.redColor);
      } else if (e.type == DioErrorType.other) {
        customToast('Oops..!! Something went wrong', AppColors.redColor);
      }
    }
  }
}
