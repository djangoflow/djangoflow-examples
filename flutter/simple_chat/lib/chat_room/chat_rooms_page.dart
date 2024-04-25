import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_bloc/flutter_list_bloc.dart';
import 'package:simple_chat/api_repository.dart';
import 'package:simple_chat/simple_chat_routes.dart';
import 'package:simple_chat/chat_room/chat_room.dart';

class ChatRoomsPage extends StatelessWidget {
  const ChatRoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: context.read<AuthCubit>(),
      listener: (BuildContext context, AuthState state) {
        if (state.isUnauthenticated) {
          Navigator.pushReplacementNamed(context, SimpleChatRoutes.home.route);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat Rooms'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () async {
                await context.read<AuthCubit>().logout();
              },
            ),
          ],
        ),
        body: const _ChatRoomsList(),
      ),
    );
  }
}

class _ChatRoomsList extends StatelessWidget {
  const _ChatRoomsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ChatRoomsListBloc>()
        ..load(const ChatRoomsListFilter(limit: 10, offset: 0)),
      child: ContinuousListViewBlocBuilder<ChatRoomsListBloc, ChatRoom,
          ChatRoomsListFilter>(
        itemBuilder: (_, __, ___, chatRoom) => _ChatRoomItem(chatRoom),
        emptyBuilder: (_, __) => const Text('No items found'),
        loadingBuilder: (_, __) => const Center(
          child: SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(),
          ),
        ),
        withRefreshIndicator: true,
        loadingItemsCount: 1,
      ),
    );
  }
}

class _ChatRoomItem extends StatelessWidget {
  const _ChatRoomItem(this._chatRoom);

  final ChatRoom _chatRoom;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        SimpleChatRoutes.chatRoom.route,
        arguments: (
          _chatRoom.id ?? 0,
          _chatRoom.title.toString(),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: Icon(
                _chatRoom.chatType == ChatTypeEnum.private
                    ? Icons.lock
                    : Icons.group,
                color: _chatRoom.chatType == ChatTypeEnum.private
                    ? Colors.grey
                    : Colors.blue,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _chatRoom.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    _chatRoom.newestMessage ?? '...',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            _chatRoom.created != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _chatRoom.created.formatWithTime(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4.0),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
