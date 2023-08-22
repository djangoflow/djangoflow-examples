import 'package:auth/constants.dart';
import 'package:auth/utils/mixins/cubit_maybe_emit_mixin.dart';
import 'package:flutter/foundation.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:openapi_repository_annotations/openapi_repository_annotations.dart';

import '../dio_interceptor.dart';

part 'api_repository.openapi.dart';

@OpenapiRepository(
  buildFor: DjangoflowOpenapi,
  blocMixins: [BlocMixin(CubitMaybeEmit)],
  builderList: [
    RepositoryBuilder(AuthApi),
  ],
  liveBasePath: baseUrl,
  baseUrl: baseUrl,
  dioInterceptor: DioInterceptor,
  defaultPageSize: 25,
  defaultOffset: 0,
  sendTimeout: 15000,
  connectTimeout: 10000,
  receiveTimeout: 15000,
)
abstract class $ApiRepository {}
