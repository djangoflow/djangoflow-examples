import 'dart:async';
import 'dart:io';

import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_websocket/djangoflow_websocket.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_chat/chat_room/chat_room.dart';
import 'package:simple_chat/home_page.dart';
import 'package:simple_chat/simple_chat_routes.dart';

import 'api_repository.dart';

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
          create: (_) =>
              AuthCubit.instance..authApi = ApiRepository.instance.auth,
        ),
        // TODO: There's a backend issue when retrieving the user id
        // BlocProvider<AuthUsersDataBloc>(
        //   create: (_) => AuthUsersDataBloc()
        //     ..load(const AuthUsersRetrieveFilter(id: '0')), // Current user
        // ),
        BlocProvider<ChatRoomsListBloc>(
          create: (context) => ChatRoomsListBloc(),
        ),
        BlocProvider<DjangoflowWebsocketCubit>.value(
          value: DjangoflowWebsocketCubit(
            config: const DjangoflowWebsocketConfig(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          SimpleChatRoutes.home.route: (_) => const HomePage(),
          SimpleChatRoutes.chatRooms.route: (_) => const ChatRoomsPage(),
          SimpleChatRoutes.chatRoom.route: (_) => const ChatRoomPage(),
          SimpleChatRoutes.chatRoomInfo.route: (_) => const ChatRoomInfoPage(),
        },
      ),
    ),
  );
}
