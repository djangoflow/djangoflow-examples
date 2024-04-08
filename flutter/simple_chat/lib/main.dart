import 'dart:async';
import 'dart:io';

import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_chat/pages/home_page/home_page.dart';

import 'api/api_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Needed for AuthCubit, as it is a hydrated bloc
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  HydratedBloc.storage = storage;

  ApiRepository.instance.updateBaseUrl(
    kIsWeb || Platform.isIOS ? baseUrl : baseUrlForAndroid,
  );

  // Add JwtAuthInterceptor
  ApiRepository.instance.api.dio.interceptors.add(
    JwtAuthInterceptor(),
  );

  runApp(
    BlocProvider<AuthCubit>(
      create: (context) =>
          AuthCubit.instance..authApi = ApiRepository.instance.auth,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auth Simple',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: const HomePage(),
      ),
    ),
  );
}
