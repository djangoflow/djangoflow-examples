// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatRoomRequestCWProxy {
  ChatRoomRequest title(String title);

  ChatRoomRequest chatType(ChatTypeEnum? chatType);

  ChatRoomRequest users(List<int> users);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomRequest call({
    String? title,
    ChatTypeEnum? chatType,
    List<int>? users,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatRoomRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatRoomRequest.copyWith.fieldName(...)`
class _$ChatRoomRequestCWProxyImpl implements _$ChatRoomRequestCWProxy {
  const _$ChatRoomRequestCWProxyImpl(this._value);

  final ChatRoomRequest _value;

  @override
  ChatRoomRequest title(String title) => this(title: title);

  @override
  ChatRoomRequest chatType(ChatTypeEnum? chatType) => this(chatType: chatType);

  @override
  ChatRoomRequest users(List<int> users) => this(users: users);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomRequest call({
    Object? title = const $CopyWithPlaceholder(),
    Object? chatType = const $CopyWithPlaceholder(),
    Object? users = const $CopyWithPlaceholder(),
  }) {
    return ChatRoomRequest(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      chatType: chatType == const $CopyWithPlaceholder()
          ? _value.chatType
          // ignore: cast_nullable_to_non_nullable
          : chatType as ChatTypeEnum?,
      users: users == const $CopyWithPlaceholder() || users == null
          ? _value.users
          // ignore: cast_nullable_to_non_nullable
          : users as List<int>,
    );
  }
}

extension $ChatRoomRequestCopyWith on ChatRoomRequest {
  /// Returns a callable class that can be used as follows: `instanceOfChatRoomRequest.copyWith(...)` or like so:`instanceOfChatRoomRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatRoomRequestCWProxy get copyWith => _$ChatRoomRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomRequest _$ChatRoomRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ChatRoomRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['title', 'users'],
        );
        final val = ChatRoomRequest(
          title: $checkedConvert('title', (v) => v as String),
          chatType: $checkedConvert('chat_type',
              (v) => $enumDecodeNullable(_$ChatTypeEnumEnumMap, v)),
          users: $checkedConvert('users',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'chatType': 'chat_type'},
    );

Map<String, dynamic> _$ChatRoomRequestToJson(ChatRoomRequest instance) {
  final val = <String, dynamic>{
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('chat_type', _$ChatTypeEnumEnumMap[instance.chatType]);
  val['users'] = instance.users;
  return val;
}

const _$ChatTypeEnumEnumMap = {
  ChatTypeEnum.group: 'group',
  ChatTypeEnum.private: 'private',
};
