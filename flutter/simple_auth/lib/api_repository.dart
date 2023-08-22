import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/foundation.dart';
import 'package:openapi_repository_annotations/openapi_repository_annotations.dart';
import 'package:simple_auth/constants.dart';

part 'api_repository.openapi.dart';

@OpenapiRepository(
  buildFor: DjangoflowOpenapi,
  builderList: [
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
