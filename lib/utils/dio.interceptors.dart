import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:time4deal/constants/api_endpoints.dart';
import 'package:time4deal/constants/app_urls.dart';
import 'package:time4deal/helpers/app_exceptions.dart';

class InterceptorApi {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
  Future<Dio> getUserApi() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = storage.read(key: 'token');
          dio.interceptors.clear();
          options.headers.addAll({'Authorization': "Bearer $token"});
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioError e, handler) async {
          if (e.response != null) {
            if (e.response?.statusCode == 403 &&
                e.response?.data['message'] == 'Forbidden') {
              RequestOptions requestOptions = e.requestOptions;
              try {
                final refreshToken = storage.read(key: 'refreshToken');
                final opts = Options(method: requestOptions.method);
                dio.options.headers['refresh'] = 'Bearer $refreshToken';

                final Response response = await dio.get(
                    AppUrls.mainUrl + ApiEndPoints.refreshToken,
                    options: opts);
                if (response.statusCode == 200) {
                  final token = response.data['accessToken'];
                  storage.write(key: 'token', value: token);
                }
              } catch (e) {
                AppExceptions.handleError(e);
              }
              final token = await storage.read(key: 'token');
              final opts = Options(method: requestOptions.method);
              dio.options.headers['Authorization'] = 'Bearer$token';
              final response = await dio.request(
                requestOptions.path,
                options: opts,
                cancelToken: requestOptions.cancelToken,
                onReceiveProgress: requestOptions.onReceiveProgress,
                data: requestOptions.data,
                queryParameters: requestOptions.queryParameters,
              );
              return handler.resolve(response);
            }
          } else {
            handler.next(e);
          }
        },
      ),
    );
    return dio;
  }
}
