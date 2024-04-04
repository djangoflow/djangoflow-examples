import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';

part 'chat_state.freezed.dart';

part 'chat_state.g.dart';

@freezed
class ChatState with _$ChatState {
  factory ChatState({
    required String roomId,
    RoomEntity? room,
    @Default(<String, MemberEntity>{}) Map<String, MemberEntity> roomUsers,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(<Message>[])
    List<Message> messages,
    User? me,
    @Default(false) bool hasNextPage,
    @Default(false) bool loading,
    @Default(false) bool uploadingImage,
    @Default(false) bool paginationLoading,
  }) = _ChatState;

  factory ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);
}
