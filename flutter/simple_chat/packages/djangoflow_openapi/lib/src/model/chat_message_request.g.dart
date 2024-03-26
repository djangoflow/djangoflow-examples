// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatMessageRequestCWProxy {
  ChatMessageRequest chatRoom(int? chatRoom);

  ChatMessageRequest message(String message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessageRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessageRequest call({
    int? chatRoom,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatMessageRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatMessageRequest.copyWith.fieldName(...)`
class _$ChatMessageRequestCWProxyImpl implements _$ChatMessageRequestCWProxy {
  const _$ChatMessageRequestCWProxyImpl(this._value);

  final ChatMessageRequest _value;

  @override
  ChatMessageRequest chatRoom(int? chatRoom) => this(chatRoom: chatRoom);

  @override
  ChatMessageRequest message(String message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessageRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessageRequest call({
    Object? chatRoom = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return ChatMessageRequest(
      chatRoom: chatRoom == const $CopyWithPlaceholder()
          ? _value.chatRoom
          // ignore: cast_nullable_to_non_nullable
          : chatRoom as int?,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $ChatMessageRequestCopyWith on ChatMessageRequest {
  /// Returns a callable class that can be used as follows: `instanceOfChatMessageRequest.copyWith(...)` or like so:`instanceOfChatMessageRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatMessageRequestCWProxy get copyWith =>
      _$ChatMessageRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageRequest _$ChatMessageRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ChatMessageRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message'],
        );
        final val = ChatMessageRequest(
          chatRoom: $checkedConvert('chat_room', (v) => v as int?),
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'chatRoom': 'chat_room'},
    );

Map<String, dynamic> _$ChatMessageRequestToJson(ChatMessageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('chat_room', instance.chatRoom);
  val['message'] = instance.message;
  return val;
}
