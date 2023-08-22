import 'package:chat/configurations/configurations.dart';
import 'package:djangoflow_app/djangoflow_app.dart';
import 'package:flutter/foundation.dart';

class AppDomain {
  static AppEnvironment get preferredEnvironment =>
      (kDebugMode || (kIsWeb && Uri.base.host.endsWith('.dev'))
          ? AppEnvironment.sandbox
          : AppEnvironment.live);

  static String getCurrent(AppEnvironment environment) {
    final domain =
        environment == AppEnvironment.live ? kLiveBasePath : kSandboxBasePath;

    return domain;
  }

  static String _getCurrentWebsocketBaseUrl(AppEnvironment environment) {
    final domain = getCurrent(environment);

    return domain.replaceFirst('http', 'ws');
  }

  static Uri? getChatWebsocketUri({
    required AppEnvironment environment,
    required String roomId,
    String? token,
  }) {
    if (token == null) {
      return null;
    }

    final websocketBaseUrl = _getCurrentWebsocketBaseUrl(environment);
    final websocketPath = '/ws/chat/$roomId/';

    final uri = Uri.parse('$websocketBaseUrl$websocketPath?token=$token');
    return uri;
  }
}
