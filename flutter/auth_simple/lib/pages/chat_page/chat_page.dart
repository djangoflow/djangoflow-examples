import 'package:auto_route/auto_route.dart';
import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import '../../state/chat_cubit/chat_cubit.dart';
import '../../state/chat_cubit/chat_state.dart' as state;

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.room,
  });

  final RoomEntity room;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ChatCubit chatCubit;
  final scrollController = AutoScrollController();

  void scrollListener() {
    if (chatCubit.state.paginationLoading || !chatCubit.state.hasNextPage) {
      return;
    }
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      chatCubit.loadMoreMessages();
    }
  }

  @override
  void initState() {
    super.initState();
    chatCubit = ChatCubit(
      DjangoflowOpenapi(
        interceptors: [JwtAuthInterceptor()],
      ).getChatApi(),
      roomId: widget.room.id.toString(),
    );
    scrollController.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.title),
      ),
      body: BlocProvider(
        create: (_) => chatCubit,
        child: BlocBuilder<ChatCubit, state.ChatState>(
          builder: (_, state) {
            return Chat(
              scrollController: scrollController,
              messages: chatCubit.state.messages,
              onSendPressed: chatCubit.handleSendPressed,
              showUserAvatars: true,
              showUserNames: true,
              user: chatCubit.state.me ??
                  const types.User(
                    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
                  ),
            );
          },
        ),
      ),
    );
  }
}
