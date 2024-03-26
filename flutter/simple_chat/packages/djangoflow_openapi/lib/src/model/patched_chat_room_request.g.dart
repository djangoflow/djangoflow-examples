// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_chat_room_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PatchedChatRoomRequestCWProxy {
  PatchedChatRoomRequest title(String? title);

  PatchedChatRoomRequest chatType(ChatTypeEnum? chatType);

  PatchedChatRoomRequest users(List<int>? users);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PatchedChatRoomRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PatchedChatRoomRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PatchedChatRoomRequest call({
    String? title,
    ChatTypeEnum? chatType,
    List<int>? users,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPatchedChatRoomRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPatchedChatRoomRequest.copyWith.fieldName(...)`
class _$PatchedChatRoomRequestCWProxyImpl
    implements _$PatchedChatRoomRequestCWProxy {
  const _$PatchedChatRoomRequestCWProxyImpl(this._value);

  final PatchedChatRoomRequest _value;

  @override
  PatchedChatRoomRequest title(String? title) => this(title: title);

  @override
  PatchedChatRoomRequest chatType(ChatTypeEnum? chatType) =>
      this(chatType: chatType);

  @override
  PatchedChatRoomRequest users(List<int>? users) => this(users: users);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PatchedChatRoomRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PatchedChatRoomRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PatchedChatRoomRequest call({
    Object? title = const $CopyWithPlaceholder(),
    Object? chatType = const $CopyWithPlaceholder(),
    Object? users = const $CopyWithPlaceholder(),
  }) {
    return PatchedChatRoomRequest(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      chatType: chatType == const $CopyWithPlaceholder()
          ? _value.chatType
          // ignore: cast_nullable_to_non_nullable
          : chatType as ChatTypeEnum?,
      users: users == const $CopyWithPlaceholder()
          ? _value.users
          // ignore: cast_nullable_to_non_nullable
          : users as List<int>?,
    );
  }
}

extension $PatchedChatRoomRequestCopyWith on PatchedChatRoomRequest {
  /// Returns a callable class that can be used as follows: `instanceOfPatchedChatRoomRequest.copyWith(...)` or like so:`instanceOfPatchedChatRoomRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PatchedChatRoomRequestCWProxy get copyWith =>
      _$PatchedChatRoomRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchedChatRoomRequest _$PatchedChatRoomRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PatchedChatRoomRequest',
      json,
      ($checkedConvert) {
        final val = PatchedChatRoomRequest(
          title: $checkedConvert('title', (v) => v as String?),
          chatType: $checkedConvert('chat_type',
              (v) => $enumDecodeNullable(_$ChatTypeEnumEnumMap, v)),
          users: $checkedConvert('users',
              (v) => (v as List<dynamic>?)?.map((e) => e as int).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'chatType': 'chat_type'},
    );

Map<String, dynamic> _$PatchedChatRoomRequestToJson(
    PatchedChatRoomRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('chat_type', _$ChatTypeEnumEnumMap[instance.chatType]);
  writeNotNull('users', instance.users);
  return val;
}

const _$ChatTypeEnumEnumMap = {
  ChatTypeEnum.group: 'group',
  ChatTypeEnum.private: 'private',
};
