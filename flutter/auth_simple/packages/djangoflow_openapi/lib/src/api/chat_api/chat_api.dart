import 'package:dio/dio.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:retrofit/http.dart';

import '../../model/create_message_entity/create_message_entity.dart';
import '../../model/message_entity/message_entity.dart';
import '../../model/pagination_room_members_entity/pagination_room_members_entity.dart';
import '../../model/pagination_room_messages_entity/pagination_room_messages_entity.dart';

part 'chat_api.g.dart';

@RestApi()
abstract class ChatApi {
  factory ChatApi(Dio dio, {String baseUrl}) = _ChatApi;

  @GET('/api/v1/chat/rooms/{roomId}/')
  Future<RoomEntity> chatRoomsRetrieve({
    @Path('roomId') required String roomId,
  });

  @GET('/api/v1/chat/rooms/{roomId}/members/')
  Future<PaginationRoomMembersEntity> chatRoomsUsersList({
    @Path('roomId') required String roomId,
  });

  @GET('/api/v1/chat/rooms/{roomId}/messages/')
  Future<PaginationRoomMessagesEntity> chatRoomsMessagesList({
    @Path('roomId') required String roomId,
    @Query('limit') int limit = 20,
    @Query('offset') int offset = 0,
  });

  @GET('/api/v1/chat/rooms/{roomId}/messages/{messageId}/')
  Future<MessageEntity> getMessage({
    @Path('roomId') required String roomId,
    @Path('messageId') required String messageId,
  });

  @POST('/api/v1/chat/rooms/{roomId}/messages/')
  Future<MessageEntity> chatRoomsMessagesCreate({
    @Path('roomId') required String roomId,
    @Body() required CreateMessageEntity message,
  });
}
