import 'package:bloc/bloc.dart';
import 'package:djangoflow_auth/djangoflow_auth.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import 'chat_state.dart' as chatState;

class ChatCubit extends Cubit<chatState.ChatState> {
  /// The [ChatApi] instance
  final ChatApi _chatApi;

  /// The default page size for pagination
  final int defaultChatPageSize;

  final String roomId;

  ChatCubit(
    this._chatApi, {
    required this.roomId,
    this.defaultChatPageSize = 20,
  }) : super(chatState.ChatState(roomId: roomId)) {
    loadData();
  }

  final _authApi = DjangoflowOpenapi(
    interceptors: [JwtAuthInterceptor()],
  ).getAuthApi();

  Future<void> loadData() async {
    startLoading();
    final room = await _chatApi.chatRoomsRetrieve(roomId: roomId);
    final result = await _chatApi.chatRoomsUsersList(roomId: roomId);
    // get current user
    final currentUser = await _authApi.authUsersRetrieve(id: '0');
    final roomUsers = Map<String, MemberEntity>.fromEntries(
      result.members.map(
        (e) => MapEntry(e.id.toString(), e),
      ),
    );

    emit(
      state.copyWith(
        loading: true,
        roomUsers: roomUsers,
        me: types.User(
          id: currentUser.data!.id,
        ),
        room: room,
      ),
    );

    await loadMoreMessages(reload: true);
  }

  /// Load messages, automatically load more messages for pagination
  Future<void> loadMoreMessages({
    bool reload = false,
  }) async {
    startPaginationLoading();
    final messages = await _chatApi.chatRoomsMessagesList(
      roomId: roomId,
      limit: defaultChatPageSize,
      offset: reload ? 0 : state.messages.length,
    );
    emit(
      state.copyWith(
        hasNextPage: messages.next != null,
      ),
    );

    final messages0 = messages.results
        .map(
          (e) => types.TextMessage(
            author: types.User(
              id: e.id.toString(),
            ),
            createdAt: e.created.millisecondsSinceEpoch,
            id: e.id.toString(),
            text: e.message,
          ),
        )
        .toList();
    stopPaginationLoading();
    emit(
      state.copyWith(
        loading: false,
        messages: reload ? messages0 : [...state.messages, ...messages0],
      ),
    );
  }

  Future<void> handleSendPressed(types.PartialText message) async {
    final result = await sendTextMessage(
      roomId: roomId,
      text: message.text,
    );

    final parsedMessage = types.TextMessage(
      author: types.User(
        id: result.createdBy.id.toString(),
      ),
      createdAt: result.created.millisecondsSinceEpoch,
      id: result.id.toString(),
      text: result.message,
    );

    addMessage(parsedMessage);
  }

  /// Send text message
  Future<MessageEntity> sendTextMessage({
    required String roomId,
    required String text,
  }) async {
    final result = await _chatApi.chatRoomsMessagesCreate(
      roomId: roomId,
      message: CreateMessageEntity(message: text),
    );

    return result;
  }

  /// Add a [Message] to `messages`
  void addMessage(types.Message message) {
    final i = state.messages.indexWhere(
      (e) => e.id == message.id,
    );

    if (i < 0) {
      emit(state.copyWith(messages: [message, ...state.messages]));
    } else {
      final messages = state.messages.toList()
        ..removeAt(i)
        ..insert(i, message);
      emit(state.copyWith(messages: messages));
    }
  }

  /// Dispatches loading state, helpful for displaying loading indicator
  void startLoading() => emit(state.copyWith(loading: true));

  /// Dispatches loading state, helpful for displaying loading indicator
  void stopLoading() => emit(state.copyWith(loading: false));

  /// Dispatches paginationLoading state, helpful for displaying loading indicator
  void startPaginationLoading() =>
      emit(state.copyWith(paginationLoading: true));

  /// Dispatches paginationLoading state, helpful for displaying loading indicator
  void stopPaginationLoading() =>
      emit(state.copyWith(paginationLoading: false));
}
