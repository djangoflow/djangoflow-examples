import 'package:dio/dio.dart';
import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/foundation.dart';
import 'package:openapi_repository_annotations/openapi_repository_annotations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:list_bloc/list_bloc.dart';

part 'api_repository.openapi.dart';

part 'api_repository.freezed.dart';

part 'api_repository.g.dart';

const baseUrl = 'http://127.0.0.1:8000';

/// It is required due to Android Emulator can't access localhost directly,
/// if you are running on Real Android Device then use baseUrl
const baseUrlForAndroid = 'http://10.0.2.2:8000';
const baseUrlForSocket = 'http://127.0.0.1:8000/chat';

@OpenapiRepository(
  buildFor: DjangoflowOpenapi,
  builderList: [
    RepositoryBuilder(ChatApi),
    RepositoryBuilder(AuthApi),
  ],
  liveBasePath: baseUrl,
  baseUrl: baseUrl,
  defaultPageSize: 25,
  defaultOffset: 0,
  sendTimeout: 15000,
  connectTimeout: 10000,
  receiveTimeout: 15000,
)
abstract class $ApiRepository {}
