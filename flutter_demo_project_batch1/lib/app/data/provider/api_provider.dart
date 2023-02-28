import 'package:dio/dio.dart';
import 'package:get/get.dart' as G;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../routes/app_pages.dart';
import '../../utils/snack_bar_utils.dart';

class AppResponse {
  String? message;
  dynamic responseBody;
  int? responseCode;

  AppResponse({this.message, this.responseBody, this.responseCode});
}

class APIProvider {
  late Dio _client;
  // static final _singleton = APIProvider();
  static APIProvider get instance => APIProvider();

  APIProvider() {
    _client = Dio(BaseOptions(baseUrl: 'https://test.com/api'));
    _client.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false));
    _client.interceptors.add(AuthInterceptor());
 
  }

  Future<AppResponse> get(String endPoint) async {
    try {
      final response = await _client.get(endPoint);
      return handleAPIResponse(response);
    } catch (e) {
      return handleAPIException(e);
    }
  }

  Future<AppResponse> post(String endPoint, dynamic body) async {
    try {
      final response = await _client.post(endPoint, data: body);
      return handleAPIResponse(response);
    } catch (e) {
      return handleAPIException(e);
    }
  }

  Future<AppResponse> delete(String endPoint) async {
    try {
      final response = await _client.delete(endPoint);
      return handleAPIResponse(response);
    } catch (e) {
      return handleAPIException(e);
    }
  }

  AppResponse handleAPIResponse(Response response) {
    if (response.statusCode == 200) {
      if (response.data['status'] != null) {
        if (response.data['status'].toString().toLowerCase() == 'error') {
          return AppResponse(
              message: response.data['message'].toString(),
              responseCode: response.statusCode);
        }
      }
      return AppResponse(
          responseBody: response.data, responseCode: response.statusCode);
    } else {
      return AppResponse(
          message: 'Something went wrong', responseCode: response.statusCode);
    }
  }

  AppResponse handleAPIException(e) {
    return AppResponse(message: 'Something went wrong');
  }
}

class AuthInterceptor extends Interceptor {
  @override
  void onResponse(response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      G.Get.back();
      G.Get.offAndToNamed(Routes.splash);
      SnackbarUtils.instance.successSnackbar('Deleted');
    } else {
      super.onResponse(response, handler);
    }
  }
}
