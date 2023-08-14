import 'dart:async';

import 'package:auth/data/api_repository/api_repository.dart';
import 'package:auth/router/router.dart';
import 'package:djangoflow_app_links/djangoflow_app_links.dart';
import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/bloc_exception_observer.dart';
// TODO uncomment after firebase integration
// import 'firebase_options.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Does not support web https://docs.flutter.dev/testing/errors#handling-all-types-of-errors
      // https://github.com/flutter/flutter/issues/100277
      FlutterError.onError = (details, {bool forceReport = false}) {
        debugPrint('>>> ${details.exception}, ${details.stack}');
      };

      if (!kDebugMode) {
        ErrorWidget.builder = (FlutterErrorDetails error) {
          Zone.current.handleUncaughtError(error.exception, error.stack!);

          return const Offstage();
        };
      }
      final storage = await HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            : await getTemporaryDirectory(),
      );

      HydratedBloc.storage = storage;
      Bloc.observer = BlocExceptionObserver();

      if (kIsWeb) {
        // initialiaze the facebook javascript SDK
        await FacebookAuth.i.webAndDesktopInitialize(
          appId: '994262658365758',
          cookie: true,
          xfbml: true,
          version: 'v14.0',
        );
      }

      String? initialDeepLink;
      final appLinksRepository = AppLinksRepository();
      if (!kIsWeb) {
        initialDeepLink = (await appLinksRepository.getInitialLink())?.path;
      }

      final appRouter = AppRouter();

      runApp(
        BlocProvider<AuthCubit>(
          create: (context) =>
              AuthCubit.instance..authApi = ApiRepository.instance.auth,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'DF Auth',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.system,
            routerConfig: appRouter.config(
              initialDeepLink: initialDeepLink, // only for Android and iOS
              // if initialDeepLink found then don't provide initialRoutes
              initialRoutes: kIsWeb || initialDeepLink != null
                  ? null
                  : [
                      const HomeRoute(),
                    ],
            ),
            builder: (context, child) => child ?? Container(),
          ),
        ),
      );
    },
    (exception, stackTrace) async {
      debugPrint('>>> $exception, $stackTrace');
    },
  );
}
