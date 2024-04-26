import 'dart:async';

import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_chat/djangoflow_chat.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:djangoflow_websocket/djangoflow_websocket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chat_ui;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:simple_chat/api_repository.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:simple_chat/simple_chat_routes.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final (roomId, name) =
        ModalRoute.of(context)!.settings.arguments as (int, String);

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            tooltip: 'Channel Info',
            onPressed: () => _navigateToChatRoomInfoPage(
              context,
              roomId.toString(),
            ),
          ),
        ],
      ),
      body: BlocListener(
        bloc: context.read<AuthCubit>(),
        listener: (BuildContext context, AuthState state) {
          if (state.isUnauthenticated) {
            Navigator.pushReplacementNamed(
                context, SimpleChatRoutes.home.route);
          }
        },
        child: BlocProvider<ChatCubit>(
          create: (context) => ChatCubit(
            ApiRepository.instance.chat,
            roomId: roomId,
            myId: _getCurrentUserId(context),
          ),
          child: _ChatRoom(roomId),
        ),
      ),
    );
  }

  int _getCurrentUserId(BuildContext context) {
    // TODO: There's a backend issue when retrieving the user id
    // The id state is null so we must retrieve it from the jwt token.
    // final authUsersCubit = context.read<AuthUsersDataBloc>();
    // final userId = authUsersCubit.state.data?.id;

    final authCubit = context.read<AuthCubit>();
    final userId = authCubit.state.token != null
        ? Jwt.parseJwt(authCubit.state.token!)['user_id'] ?? 0
        : 0;

    return userId;
  }

  void _navigateToChatRoomInfoPage(
    BuildContext context,
    String roomId,
  ) =>
      Navigator.pushNamed(
        context,
        SimpleChatRoutes.chatRoomInfo.route,
        arguments: roomId,
      );
}

class _ChatRoom extends StatefulWidget {
  const _ChatRoom(this.roomId);

  final int roomId;

  @override
  State<_ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<_ChatRoom> {
  List<types.Message> _messages = [];
  late types.User _user;

  /// It is required due to Android Emulator can't access localhost directly,
  /// if you are running on Real Android Device then use 127.0.0.1
  static const _webSocketUrl = 'ws://10.0.2.2:8000/ws/chat/?token=';

  @override
  void initState() {
    super.initState();
    _loadInitialChatData();
    _connectToWebSocket();
  }

  Future<void> _loadInitialChatData() async {
    final chatCubit = context.read<ChatCubit>();
    await chatCubit.loadData();

    final user = chatCubit.state.me;

    if (user != null) {
      _user = types.User(
        id: user.id.toString(),
        firstName: user.firstName,
        lastName: user.lastName,
      );
    }
  }

  void _connectToWebSocket() {
    final webSocketCubit = context.read<DjangoflowWebsocketCubit>();
    final authCubit = context.read<AuthCubit>();
    final jwtToken = authCubit.state.token;
    webSocketCubit.connectToUri(Uri.parse('$_webSocketUrl$jwtToken'));
  }

  @override
  Widget build(BuildContext context) {
    return DjangoflowWebsocketBlocListener(
      bloc: context.read<DjangoflowWebsocketCubit>(),
      listener: (context, state) {
        final messages =
            Map<String, dynamic>.fromEntries(state.message!.entries);
        final message = ChatMessage.fromJson(messages);
        final chatCubit = context.read<ChatCubit>();
        chatCubit.addMessage(message);
      },
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) => _loadMessages(state.messages),
        builder: (context, state) {
          if (state.loading) {
            return const Center(
              child: SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(),
              ),
            );
          }

          return chat_ui.Chat(
            messages: _messages,
            onSendPressed: _handleSendPressed,
            showUserAvatars: true,
            showUserNames: true,
            user: _user,
            theme: const chat_ui.DefaultChatTheme(
              seenIcon: Text(
                'read',
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleSendPressed(types.PartialText message) async {
    final chatCubit = context.read<ChatCubit>();
    final sentMessage = await chatCubit.sendTextMessage(text: message.text);
    if (sentMessage != null) {
      chatCubit.addMessage(sentMessage);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error sending the message. Try again.'),
          ),
        );
      }
    }
  }

  void _loadMessages(List<ChatMessage> messages) {
    setState(() {
      _messages = _parseMessages(messages);
    });
  }

  List<types.TextMessage> _parseMessages(List<ChatMessage> messages) {
    return messages
        .map(
          (e) => types.TextMessage(
            id: e.id.toString(),
            author: types.User(
              id: e.createdBy?.id.toString() ?? '',
              firstName: e.createdBy?.firstName,
              lastName: e.createdBy?.lastName,
            ),
            type: types.MessageType.text,
            text: e.message,
            createdAt: e.created?.millisecond,
            updatedAt: e.modified?.millisecond,
          ),
        )
        .toList();
  }
}
