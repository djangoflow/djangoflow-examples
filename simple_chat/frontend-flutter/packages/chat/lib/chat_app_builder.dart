import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/app/app.dart';
import 'features/authentication/authentication.dart';
import 'configurations/configurations.dart';

// project specific
class ChatAppBuilder extends AppBuilder {
  ChatAppBuilder({
    super.key,
    super.onDispose,
    required AppRouter appRouter,
  }) : super(
          providers: [
            BlocProvider<AppCubit>(
              create: (context) => AppCubit.instance,
            ),
            BlocProvider<AuthCubit>(
              create: (context) => AuthCubit.instance,
            ),
          ],
          builder: (context) => LoginListenerWrapper(
            initialUser: context.read<AuthCubit>().state.user,
            onLogin: (context, user) {
              context.read<AuthCubit>().reload();
            },
            child: AppCubitConsumer(
              listenWhen: (previous, current) =>
                  previous.environment != current.environment,
              listener: (context, state) async {
                final authCubit = context.read<AuthCubit>();
                // logout when env changes
                if (authCubit.state.token != null) {
                  await authCubit.logout();
                }
              },
              builder: (context, appState) => MaterialApp.router(
                debugShowCheckedModeBanner: false,
                scaffoldMessengerKey:
                    DjangoflowAppSnackbar.scaffoldMessengerKey,
                title: kAppTitle,
                routeInformationParser: RouteParser(
                  appRouter.matcher,
                  includePrefixMatches: true,
                ),
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: appState.themeMode,
                locale: Locale(appState.locale, ''),
                supportedLocales: const [
                  Locale('en', ''),
                ],
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                routerDelegate: appRouter.delegate(
                  initialRoutes: kIsWeb
                      ? null
                      : [
                          SplashRoute(backgroundColor: Colors.white),
                        ],
                ),
                builder: (context, child) => AppResponsiveLayoutBuilder(
                  background: Container(
                    color: Colors.black87, // use theme color
                  ),
                  child: SandboxBanner(
                    isSandbox: appState.environment == AppEnvironment.sandbox,
                    child: child ?? const Offstage(),
                  ),
                ),
              ),
            ),
          ),
        );
}
