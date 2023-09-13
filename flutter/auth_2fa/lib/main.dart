import 'dart:async';
import 'dart:io';

import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'api_repository.dart';
import 'home_page.dart';

const defaultUserId = '0';

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

  ApiRepository.instance.interceptors.add(JwtAuthInterceptor());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) =>
              AuthCubit.instance..authApi = ApiRepository.instance.auth,
        ),
        BlocProvider<UsersUsersDataBloc>(
          create: (context) {
            final cubit = UsersUsersDataBloc();
            if (context.read<AuthCubit>().state.isAuthenticated) {
              cubit.load(const UsersUsersRetrieveFilter(id: defaultUserId));
            }

            return cubit;
          },
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
