import 'package:dio/dio.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:list_bloc/list_bloc.dart';
import 'package:openapi_repository_annotations/openapi_repository_annotations.dart';

part 'api_repository.freezed.dart';

part 'api_repository.g.dart';

part 'api_repository.openapi.dart';

const baseUrl = 'http://127.0.0.1:8000';

/// It is required due to Android Emulator can't access localhost directly,
/// if you are running on Real Android Device then use baseUrl
const baseUrlForAndroid = 'http://10.0.2.2:8000';

@OpenapiRepository(
  buildFor: DjangoflowOpenapi,
  builderList: [
    RepositoryBuilder(AuthApi),
    RepositoryBuilder(RoomsApi),
    RepositoryBuilder(ChatApi),
  ],
  liveBasePath: baseUrl,
  baseUrl: baseUrl,
  defaultPageSize: 20,
  defaultOffset: 0,
  sendTimeout: 15000,
  connectTimeout: 10000,
  receiveTimeout: 15000,
)
abstract class $ApiRepository {}
