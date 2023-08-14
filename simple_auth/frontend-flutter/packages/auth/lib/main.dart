import 'dart:async';
import 'dart:io';

import 'package:auth/data/api_repository/api_repository.dart';
import 'package:auth/router/router.dart';
import 'package:djangoflow_app_links/djangoflow_app_links.dart';
import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_auth_apple/djangoflow_auth_apple.dart';
import 'package:djangoflow_auth_google/djangoflow_auth_google.dart';
import 'package:djangoflow_auth_facebook/djangoflow_auth_facebook.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/bloc_exception_observer.dart';
import 'constants.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        name: 'djangoflow',
        options: DefaultFirebaseOptions.currentPlatform,
      );

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

      ApiRepository.instance.updateBaseUrl(
        kIsWeb || Platform.isIOS ? baseUrl : baseUrlForAndroid,
      );

      runApp(
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit.instance
            ..authApi = ApiRepository.instance.auth
            ..socialLogins = [
              GoogleSocialLogin(
                googleSignIn: GoogleSignIn(
                  scopes: [
                    'email',
                  ],
                ),
                type: SocialLoginType.fromProvider(
                  ProviderEnum.googleOauth2,
                ),
              ),
              AppleSocialLogin(
                type: SocialLoginType.fromProvider(
                  ProviderEnum.appleId,
                ),
              ),
              FacebookSocialLogin(
                type: SocialLoginType.fromProvider(
                  ProviderEnum.facebook,
                ),
              ),
            ],
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
