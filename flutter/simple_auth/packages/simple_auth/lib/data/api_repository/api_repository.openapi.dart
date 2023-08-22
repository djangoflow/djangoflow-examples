// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_repository.dart';

// **************************************************************************
// OpenapiRepositoryGenerator
// **************************************************************************

class ApiRepository {
  static ApiRepository get instance => _instance;
  static final ApiRepository _instance = ApiRepository._internal();

  ApiRepository._internal() {
    _openapi.dio.options
      ..baseUrl = sandboxBasePath
      ..connectTimeout = const Duration(milliseconds: 10000)
      ..receiveTimeout = const Duration(milliseconds: 15000)
      ..sendTimeout = const Duration(milliseconds: 15000);
    _openapi.dio.interceptors.add(DioInterceptor());
  }

  static const String liveBasePath = 'http://127.0.0.1:8000';
  static const String sandboxBasePath = 'http://127.0.0.1:8000';

  void updateBaseUrl(String baseUrl) {
    _openapi.dio.options.baseUrl = baseUrl;
  }

  static final DjangoflowOpenapi _openapi = DjangoflowOpenapi(
    basePathOverride: kReleaseMode ? liveBasePath : null,
    interceptors: [],
  );

  DjangoflowOpenapi get api => _openapi;
  AuthApi get auth => api.getAuthApi();
}
