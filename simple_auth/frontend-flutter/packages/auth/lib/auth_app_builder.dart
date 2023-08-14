// import 'package:djangoflow_app/djangoflow_app.dart';
// import 'package:djangoflow_app_links/djangoflow_app_links.dart';
// import 'package:djangoflow_auth/djangoflow_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'features/app/app.dart';
// import 'features/authentication/authentication.dart';
// import 'configurations/configurations.dart';

// // project specific
// class AuthAppBuilder extends AppBuilder {
//   AuthAppBuilder({
//     super.key,
//     super.onDispose,
//     required AppRouter appRouter,
//     required AppLinksRepository appLinksRepository,
//     final String? initialDeepLink,
//   }) : super(
//           repositoryProviders: [
//             RepositoryProvider<AppLinksRepository>.value(
//               value: appLinksRepository,
//             ),
//           ],
//           providers: [
//             BlocProvider<AppCubit>(
//               create: (context) => AppCubit.instance,
//             ),
//             BlocProvider<AuthCubit>(
//               create: (context) => AuthCubit.instance,
//             ),
//           ],
//           builder: (context) => LoginListenerWrapper(
//             initialToken: context.read<AuthCubit>().state.token,
//             onLogin: (context) {},
//             onLogout: (context) {
//               appRouter.pushAndPopUntil(
//                 const HomeRoute(),
//                 predicate: (route) => false,
//               );
//             },
//             child: AppCubitConsumer(
//               listenWhen: (previous, current) =>
//                   previous.environment != current.environment,
//               listener: (context, state) async {
//                 final authCubit = context.read<AuthCubit>();
//                 // logout when env changes
//                 if (authCubit.state.token != null) {
//                   await authCubit.logout();
//                 }
//               },
//               builder: (context, appState) =>
//             ),
//           ),
//         );
// }
