// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: sort_constructors_first, sort_unnamed_constructors_first

part of 'api_repository.dart';

// **************************************************************************
// OpenapiRepositoryGenerator
// **************************************************************************

class ApiRepository {
  static ApiRepository get instance => _instance;
  static final ApiRepository _instance = ApiRepository._internal();

  ApiRepository._internal() {
    _openapi.dio.options
      ..baseUrl = sandboxBasePath
      ..connectTimeout = const Duration(milliseconds: 10000)
      ..receiveTimeout = const Duration(milliseconds: 15000)
      ..sendTimeout = const Duration(milliseconds: 15000);
  }

  static const String liveBasePath = 'http://127.0.0.1:8000';
  static const String sandboxBasePath = 'http://127.0.0.1:8000';

  void updateBaseUrl(String baseUrl) {
    _openapi.dio.options.baseUrl = baseUrl;
  }

  Interceptors get interceptors => _openapi.dio.interceptors;

  static final DjangoflowOpenapi _openapi = DjangoflowOpenapi(
    basePathOverride: kReleaseMode ? liveBasePath : null,
    interceptors: [],
  );

  DjangoflowOpenapi get api => _openapi;
  ChatApi get chat => api.getChatApi();
}

//Typdef for ChatRoomsListState

typedef ChatRoomsListState = Data<List<ChatRoom>, ChatRoomsListFilter>;

//Filter for ChatRoomsListFilter

@freezed
class ChatRoomsListFilter
    with _$ChatRoomsListFilter
    implements OffsetLimitFilter {
  static const kPageSize = 25;
  const ChatRoomsListFilter._();

  @Implements<OffsetLimitFilter>()
  const factory ChatRoomsListFilter({
    @Default(25) int limit,
    @Default(0) int offset,
  }) = _ChatRoomsListFilter;

  factory ChatRoomsListFilter.fromJson(
    Map<String, dynamic> map,
  ) =>
      _$ChatRoomsListFilterFromJson(map);

  @override
  ChatRoomsListFilter copyWithOffset(int offset) => copyWith(offset: offset);
}

//Typdef for ChatRoomsRetrieveState

typedef ChatRoomsRetrieveState = Data<ChatRoom, ChatRoomsRetrieveFilter>;

//Filter for ChatRoomsRetrieveFilter

@freezed
class ChatRoomsRetrieveFilter with _$ChatRoomsRetrieveFilter {
  const ChatRoomsRetrieveFilter._();

  const factory ChatRoomsRetrieveFilter({
    required String id,
  }) = _ChatRoomsRetrieveFilter;

  factory ChatRoomsRetrieveFilter.fromJson(
    Map<String, dynamic> map,
  ) =>
      _$ChatRoomsRetrieveFilterFromJson(map);
}

// RepositoryMixin for ChatRoomsRepositoryMixin

mixin ChatRoomsRepositoryMixin {
  static Future<ChatRoom> retrieve([
    ChatRoomsRetrieveFilter? filter,
  ]) async {
    if (filter == null) {
      throw Exception('Invalid filter');
    }
    final r = await ApiRepository.instance.chat.chatRoomsRetrieve(
      id: filter.id,
    );
    if (r.data == null) {
      throw Exception('Failed to load data!');
    } else {
      return r.data!;
    }
  }

  static Future<List<ChatRoom>> list([
    ChatRoomsListFilter? filter,
  ]) async {
    final r = await ApiRepository.instance.chat.chatRoomsList(
      limit: filter?.limit,
      offset: filter?.offset,
    );

    return r.data?.results?.toList(growable: false) ?? [];
  }

  Future<ChatRoom?> create({
    required ChatRoomRequest chatRoomRequest,
  }) async {
    final r = (await ApiRepository.instance.chat.chatRoomsCreate(
      chatRoomRequest: chatRoomRequest,
    ));

    return r.data;
  }

  Future<ChatRoom?> partialUpdate({
    required String id,
    PatchedChatRoomRequest? patchedChatRoomRequest,
  }) async {
    final r = (await ApiRepository.instance.chat.chatRoomsPartialUpdate(
      id: id,
      patchedChatRoomRequest: patchedChatRoomRequest,
    ));

    return r.data;
  }

  Future<ChatRoom?> updateObject({
    required String id,
    required ChatRoomRequest chatRoomRequest,
  }) async {
    final r = (await ApiRepository.instance.chat.chatRoomsUpdate(
      id: id,
      chatRoomRequest: chatRoomRequest,
    ));

    return r.data;
  }

  Future<Object?> destroy({
    required String id,
  }) async {
    final r = (await ApiRepository.instance.chat.chatRoomsDestroy(
      id: id,
    ));

    return r.data;
  }
}

// DataCubit for ChatRooms

class ChatRoomsDataBloc extends DataCubit<ChatRoom, ChatRoomsRetrieveFilter>
    with ChatRoomsRepositoryMixin {
  ChatRoomsDataBloc() : super(ChatRoomsRepositoryMixin.retrieve);

  @override
  Future<ChatRoom?> create({
    required ChatRoomRequest chatRoomRequest,
  }) async {
    final r = await super.create(
      chatRoomRequest: chatRoomRequest,
    );

    return r;
  }

  @override
  Future<ChatRoom?> partialUpdate({
    required String id,
    PatchedChatRoomRequest? patchedChatRoomRequest,
  }) async {
    final r = await super.partialUpdate(
      id: id,
      patchedChatRoomRequest: patchedChatRoomRequest,
    );

    return r;
  }

  @override
  Future<ChatRoom?> updateObject({
    required String id,
    required ChatRoomRequest chatRoomRequest,
  }) async {
    final r = await super.updateObject(
      id: id,
      chatRoomRequest: chatRoomRequest,
    );

    return r;
  }

  @override
  Future<Object?> destroy({
    required String id,
  }) async {
    final r = await super.destroy(
      id: id,
    );

    return r;
  }
}

// ListCubit for ChatRooms

class ChatRoomsListBloc extends ListCubit<ChatRoom, ChatRoomsListFilter>
    with ChatRoomsRepositoryMixin {
  ChatRoomsListBloc() : super(ChatRoomsRepositoryMixin.list);

  @override
  Future<ChatRoom?> create({
    required ChatRoomRequest chatRoomRequest,
  }) async {
    final r = await super.create(
      chatRoomRequest: chatRoomRequest,
    );
    await super.reload();

    return r;
  }

  @override
  Future<ChatRoom?> partialUpdate({
    required String id,
    PatchedChatRoomRequest? patchedChatRoomRequest,
  }) async {
    final r = await super.partialUpdate(
      id: id,
      patchedChatRoomRequest: patchedChatRoomRequest,
    );
    await super.reload();

    return r;
  }

  @override
  Future<ChatRoom?> updateObject({
    required String id,
    required ChatRoomRequest chatRoomRequest,
  }) async {
    final r = await super.updateObject(
      id: id,
      chatRoomRequest: chatRoomRequest,
    );
    await super.reload();

    return r;
  }

  @override
  Future<Object?> destroy({
    required String id,
  }) async {
    final r = await super.destroy(
      id: id,
    );
    await super.reload();

    return r;
  }
}

//Typdef for ChatRoomsMembersRetrieveState

typedef ChatRoomsMembersRetrieveState
    = Data<ChatRoomMemberList, ChatRoomsMembersRetrieveFilter>;

//Filter for ChatRoomsMembersRetrieveFilter

@freezed
class ChatRoomsMembersRetrieveFilter with _$ChatRoomsMembersRetrieveFilter {
  const ChatRoomsMembersRetrieveFilter._();

  const factory ChatRoomsMembersRetrieveFilter({
    required String id,
  }) = _ChatRoomsMembersRetrieveFilter;

  factory ChatRoomsMembersRetrieveFilter.fromJson(
    Map<String, dynamic> map,
  ) =>
      _$ChatRoomsMembersRetrieveFilterFromJson(map);
}

// RepositoryMixin for ChatRoomsMembersRepositoryMixin

mixin ChatRoomsMembersRepositoryMixin {
  static Future<ChatRoomMemberList> retrieve([
    ChatRoomsMembersRetrieveFilter? filter,
  ]) async {
    if (filter == null) {
      throw Exception('Invalid filter');
    }
    final r = await ApiRepository.instance.chat.chatRoomsMembersRetrieve(
      id: filter.id,
    );
    if (r.data == null) {
      throw Exception('Failed to load data!');
    } else {
      return r.data!;
    }
  }
}

// DataCubit for ChatRoomsMembers

class ChatRoomsMembersDataBloc
    extends DataCubit<ChatRoomMemberList, ChatRoomsMembersRetrieveFilter>
    with ChatRoomsMembersRepositoryMixin {
  ChatRoomsMembersDataBloc() : super(ChatRoomsMembersRepositoryMixin.retrieve);
}

//Typdef for ChatRoomsMessagesListState

typedef ChatRoomsMessagesListState
    = Data<List<ChatMessage>, ChatRoomsMessagesListFilter>;

//Filter for ChatRoomsMessagesListFilter

@freezed
class ChatRoomsMessagesListFilter
    with _$ChatRoomsMessagesListFilter
    implements OffsetLimitFilter {
  static const kPageSize = 25;
  const ChatRoomsMessagesListFilter._();

  @Implements<OffsetLimitFilter>()
  const factory ChatRoomsMessagesListFilter({
    required String roomId,
    @Default(25) int limit,
    @Default(0) int offset,
  }) = _ChatRoomsMessagesListFilter;

  factory ChatRoomsMessagesListFilter.fromJson(
    Map<String, dynamic> map,
  ) =>
      _$ChatRoomsMessagesListFilterFromJson(map);

  @override
  ChatRoomsMessagesListFilter copyWithOffset(int offset) =>
      copyWith(offset: offset);
}

//Typdef for ChatRoomsMessagesRetrieveState

typedef ChatRoomsMessagesRetrieveState
    = Data<ChatMessage, ChatRoomsMessagesRetrieveFilter>;

//Filter for ChatRoomsMessagesRetrieveFilter

@freezed
class ChatRoomsMessagesRetrieveFilter with _$ChatRoomsMessagesRetrieveFilter {
  const ChatRoomsMessagesRetrieveFilter._();

  const factory ChatRoomsMessagesRetrieveFilter({
    required int id,
    required String roomId,
  }) = _ChatRoomsMessagesRetrieveFilter;

  factory ChatRoomsMessagesRetrieveFilter.fromJson(
    Map<String, dynamic> map,
  ) =>
      _$ChatRoomsMessagesRetrieveFilterFromJson(map);
}

// RepositoryMixin for ChatRoomsMessagesRepositoryMixin

mixin ChatRoomsMessagesRepositoryMixin {
  static Future<ChatMessage> retrieve([
    ChatRoomsMessagesRetrieveFilter? filter,
  ]) async {
    if (filter == null) {
      throw Exception('Invalid filter');
    }
    final r = await ApiRepository.instance.chat.chatRoomsMessagesRetrieve(
      id: filter.id,
      roomId: filter.roomId,
    );
    if (r.data == null) {
      throw Exception('Failed to load data!');
    } else {
      return r.data!;
    }
  }

  static Future<List<ChatMessage>> list([
    ChatRoomsMessagesListFilter? filter,
  ]) async {
    if (filter == null) {
      throw Exception('Invalid filter');
    }
    final r = await ApiRepository.instance.chat.chatRoomsMessagesList(
      roomId: filter.roomId,
      limit: filter.limit,
      offset: filter.offset,
    );

    return r.data?.results?.toList(growable: false) ?? [];
  }

  Future<ChatMessage?> create({
    required String roomId,
    required ChatMessageRequest chatMessageRequest,
  }) async {
    final r = (await ApiRepository.instance.chat.chatRoomsMessagesCreate(
      roomId: roomId,
      chatMessageRequest: chatMessageRequest,
    ));

    return r.data;
  }

  Future<ChatMessageUpdate?> partialUpdate({
    required int id,
    required String roomId,
    PatchedChatMessageUpdateRequest? patchedChatMessageUpdateRequest,
  }) async {
    final r = (await ApiRepository.instance.chat.chatRoomsMessagesPartialUpdate(
      id: id,
      roomId: roomId,
      patchedChatMessageUpdateRequest: patchedChatMessageUpdateRequest,
    ));

    return r.data;
  }

  Future<ChatMessageUpdate?> updateObject({
    required int id,
    required String roomId,
    required ChatMessageUpdateRequest chatMessageUpdateRequest,
  }) async {
    final r = (await ApiRepository.instance.chat.chatRoomsMessagesUpdate(
      id: id,
      roomId: roomId,
      chatMessageUpdateRequest: chatMessageUpdateRequest,
    ));

    return r.data;
  }

  Future<Object?> destroy({
    required int id,
    required String roomId,
  }) async {
    final r = (await ApiRepository.instance.chat.chatRoomsMessagesDestroy(
      id: id,
      roomId: roomId,
    ));

    return r.data;
  }
}

// DataCubit for ChatRoomsMessages

class ChatRoomsMessagesDataBloc
    extends DataCubit<ChatMessage, ChatRoomsMessagesRetrieveFilter>
    with ChatRoomsMessagesRepositoryMixin {
  ChatRoomsMessagesDataBloc()
      : super(ChatRoomsMessagesRepositoryMixin.retrieve);

  @override
  Future<ChatMessage?> create({
    required String roomId,
    required ChatMessageRequest chatMessageRequest,
  }) async {
    final r = await super.create(
      roomId: roomId,
      chatMessageRequest: chatMessageRequest,
    );

    return r;
  }

  @override
  Future<ChatMessageUpdate?> partialUpdate({
    required int id,
    required String roomId,
    PatchedChatMessageUpdateRequest? patchedChatMessageUpdateRequest,
  }) async {
    final r = await super.partialUpdate(
      id: id,
      roomId: roomId,
      patchedChatMessageUpdateRequest: patchedChatMessageUpdateRequest,
    );

    return r;
  }

  @override
  Future<ChatMessageUpdate?> updateObject({
    required int id,
    required String roomId,
    required ChatMessageUpdateRequest chatMessageUpdateRequest,
  }) async {
    final r = await super.updateObject(
      id: id,
      roomId: roomId,
      chatMessageUpdateRequest: chatMessageUpdateRequest,
    );

    return r;
  }

  @override
  Future<Object?> destroy({
    required int id,
    required String roomId,
  }) async {
    final r = await super.destroy(
      id: id,
      roomId: roomId,
    );

    return r;
  }
}

// ListCubit for ChatRoomsMessages

class ChatRoomsMessagesListBloc
    extends ListCubit<ChatMessage, ChatRoomsMessagesListFilter>
    with ChatRoomsMessagesRepositoryMixin {
  ChatRoomsMessagesListBloc() : super(ChatRoomsMessagesRepositoryMixin.list);

  @override
  Future<ChatMessage?> create({
    required String roomId,
    required ChatMessageRequest chatMessageRequest,
  }) async {
    final r = await super.create(
      roomId: roomId,
      chatMessageRequest: chatMessageRequest,
    );
    await super.reload();

    return r;
  }

  @override
  Future<ChatMessageUpdate?> partialUpdate({
    required int id,
    required String roomId,
    PatchedChatMessageUpdateRequest? patchedChatMessageUpdateRequest,
  }) async {
    final r = await super.partialUpdate(
      id: id,
      roomId: roomId,
      patchedChatMessageUpdateRequest: patchedChatMessageUpdateRequest,
    );
    await super.reload();

    return r;
  }

  @override
  Future<ChatMessageUpdate?> updateObject({
    required int id,
    required String roomId,
    required ChatMessageUpdateRequest chatMessageUpdateRequest,
  }) async {
    final r = await super.updateObject(
      id: id,
      roomId: roomId,
      chatMessageUpdateRequest: chatMessageUpdateRequest,
    );
    await super.reload();

    return r;
  }

  @override
  Future<Object?> destroy({
    required int id,
    required String roomId,
  }) async {
    final r = await super.destroy(
      id: id,
      roomId: roomId,
    );
    await super.reload();

    return r;
  }
}
