import 'dart:developer';

import 'package:djangoflow_chat/djangoflow_chat.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:djangoflow_websocket/djangoflow_websocket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as chat;
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:simple_chat/api/api_repository.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.room,
    required this.currentUser,
  });

  final ChatRoom room;
  final UserIdentity currentUser;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final scrollController = AutoScrollController();
  late final ChatCubit chatCubit;
  late final DjangoflowWebsocketCubit websocketCubit;

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      /// Gen next messages (but with issue)
      chatCubit.loadMoreMessages(
        roomId: chatCubit.roomId,
      );
    }
  }

  void init() {
    chatCubit = ChatCubit(
      ApiRepository.instance.chat,
      roomId: widget.room.id!,
      myId: int.parse(widget.currentUser.id!),
    )..loadData();
    //TODO add config
    websocketCubit = DjangoflowWebsocketCubit(
      config: const DjangoflowWebsocketConfig(),
    )..connectToUri(Uri.parse(baseUrlForSocket));
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    websocketCubit.disconnect();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> onSendMessage(types.PartialText text) async {
    final message = await chatCubit.sendTextMessage(
      text: text.text,
    );
    if (message != null) {
      chatCubit.addMessage(message);
    }
  }

  Future<void> onNewMessage(types.PartialText text) async {
    ///TODO check this part
    // if (message != null) {
    //   chatCubit.addMessage(message);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.title),
      ),
      body: BlocProvider(
        create: (_) => chatCubit,

        /// What is purpose using this builder we can just listen new event and push new message to messages list
        child: DjangoflowWebsocketBlocListener(
          bloc: websocketCubit,
          listener: (_, state) {
            // Get event via socket
            if (state.message != null) {
              log('socket event');
              log('${state.message}');
              // onNewMessage(MessageEvent(type));
            }
          },
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (_, state) {
              // Convert data
              final _messages = state.messages
                  .map(
                    (e) => types.TextMessage(
                      author: types.User(
                        id: e.createdBy!.id!.toString(),
                      ),
                      createdAt: e.created!.millisecondsSinceEpoch,
                      id: e.id.toString(),
                      text: e.message,
                    ),
                  )
                  .toList();

              return chat.Chat(
                scrollController: scrollController,
                messages: _messages,
                onSendPressed: onSendMessage,
                showUserAvatars: true,
                showUserNames: true,
                user: types.User(
                  id: chatCubit.myId.toString(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
