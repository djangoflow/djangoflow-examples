import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExceptionObserver extends BlocObserver {
  BlocExceptionObserver() : super();

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      debugPrint(transition.toString());
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      debugPrint('${bloc.runtimeType}');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('>>> ${bloc.runtimeType} $error, $stackTrace');

    super.onError(bloc, error, stackTrace);
  }
}
