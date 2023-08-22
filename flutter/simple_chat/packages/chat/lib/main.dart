import 'dart:async';

import 'package:chat/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/material.dart';

import 'chat_app_builder.dart';
import 'configurations/configurations.dart';

Future<void> main() async {
  // Runs the runApp method
  DjangoflowAppRunner.run(
    onException: (exception, stackTrace) {
      debugPrint('Exception Caught -- $exception');
      DjangoflowAppSnackbar.showError(
        exception is DioError
            ? exception.message ?? 'Something went wrong!'
            : exception.toString(),
      );
    },
    rootWidgetBuilder: (appBuilder) async {
      AppCubit.initialState = AppState(
        themeMode: ThemeMode.dark,
        environment: AppDomain.preferredEnvironment,
      );

      // initialize router
      final router = AppRouter(
        authGuard: AuthGuard(),
      );

      return appBuilder(
        ChatAppBuilder(
          appRouter: router,
        ),
      );
    },
  );
}
