import 'package:dio/dio.dart';
import '../error/exceptions.dart';
import 'api_response.dart';

abstract class NetworkClient {
  Future<ApiResponse> get(String url,
      {Map<String, dynamic> queryParams,
      Map<String, dynamic> headers = const {}});

  Future<ApiResponse> post(String url, FormData formData,
      [Map<String, dynamic> headers = const {}]);
}

class NetworkClientDio implements NetworkClient {
  final dio = Dio();

  @override
  Future<ApiResponse> get(String url,
      {Map<String, dynamic> queryParams = const {},
      Map<String, dynamic> headers = const {}}) async {
    Response urlResponse;
    try {
      urlResponse = await dio.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
    } on DioError catch (e) {
      throw ServerException(null, e.message);
    }

    final userResponse = ApiResponse(
        data: urlResponse.data,
        requestOptions: urlResponse.requestOptions,
        isRedirect: urlResponse.isRedirect,
        statusCode: urlResponse.statusCode,
        statusMessage: urlResponse.statusMessage);

    return userResponse;
  }

  @override
  Future<ApiResponse> post(String url, FormData formData,
      [Map<String, dynamic> headers = const {}]) async {
    Response urlResponse = await dio.post(
      url,
      data: formData,
      
      options: Options(headers: headers),
    );
    final userResponse = ApiResponse(
        data: urlResponse.data,
        requestOptions: urlResponse.requestOptions,
        isRedirect: urlResponse.isRedirect,
        statusCode: urlResponse.statusCode,
        statusMessage: urlResponse.statusMessage);

    return userResponse;
  }
}
