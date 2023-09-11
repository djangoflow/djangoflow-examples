import 'dart:async';
import 'dart:io';

import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_auth_apple/djangoflow_auth_apple.dart';
import 'package:djangoflow_auth_discord/djangoflow_auth_discord.dart';
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
import 'package:simple_auth/home_page.dart';

import 'api_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Needed for AuthCubit, as it is a hydrated bloc
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  HydratedBloc.storage = storage;

  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    await FacebookAuth.i.webAndDesktopInitialize(
      appId: '994262658365758',
      cookie: true,
      xfbml: true,
      version: 'v14.0',
    );
  }

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
          DiscordSocialLoginProvider(
            type: SocialLoginType.fromProvider(
              ProviderEnum.discord,
            ),
            oAuth2Configuration: const OAuth2Configuration(
              clientId: 'your_discord_client_id',
              redirectUri: 'https://your_redirect_uri',
              scope: 'identify email', // adjust according to your need
              responseType: 'token',
              customUriScheme:
                  'your_custom_uri_scheme', // could https/http, complete custom uri redirect does not support on Discord
            ),
          ),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simple Auth',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: const HomePage(),
      ),
    ),
  );
}
