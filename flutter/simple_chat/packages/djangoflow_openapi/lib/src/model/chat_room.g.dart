// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatRoomCWProxy {
  ChatRoom id(int? id);

  ChatRoom title(String title);

  ChatRoom created(DateTime? created);

  ChatRoom chatType(ChatTypeEnum? chatType);

  ChatRoom newestMessage(String? newestMessage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoom(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoom(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoom call({
    int? id,
    String? title,
    DateTime? created,
    ChatTypeEnum? chatType,
    String? newestMessage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatRoom.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatRoom.copyWith.fieldName(...)`
class _$ChatRoomCWProxyImpl implements _$ChatRoomCWProxy {
  const _$ChatRoomCWProxyImpl(this._value);

  final ChatRoom _value;

  @override
  ChatRoom id(int? id) => this(id: id);

  @override
  ChatRoom title(String title) => this(title: title);

  @override
  ChatRoom created(DateTime? created) => this(created: created);

  @override
  ChatRoom chatType(ChatTypeEnum? chatType) => this(chatType: chatType);

  @override
  ChatRoom newestMessage(String? newestMessage) =>
      this(newestMessage: newestMessage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoom(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoom(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoom call({
    Object? id = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? created = const $CopyWithPlaceholder(),
    Object? chatType = const $CopyWithPlaceholder(),
    Object? newestMessage = const $CopyWithPlaceholder(),
  }) {
    return ChatRoom(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      created: created == const $CopyWithPlaceholder()
          ? _value.created
          // ignore: cast_nullable_to_non_nullable
          : created as DateTime?,
      chatType: chatType == const $CopyWithPlaceholder()
          ? _value.chatType
          // ignore: cast_nullable_to_non_nullable
          : chatType as ChatTypeEnum?,
      newestMessage: newestMessage == const $CopyWithPlaceholder()
          ? _value.newestMessage
          // ignore: cast_nullable_to_non_nullable
          : newestMessage as String?,
    );
  }
}

extension $ChatRoomCopyWith on ChatRoom {
  /// Returns a callable class that can be used as follows: `instanceOfChatRoom.copyWith(...)` or like so:`instanceOfChatRoom.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatRoomCWProxy get copyWith => _$ChatRoomCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoom _$ChatRoomFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ChatRoom',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['title'],
        );
        final val = ChatRoom(
          id: $checkedConvert('id', (v) => v as int?),
          title: $checkedConvert('title', (v) => v as String),
          created: $checkedConvert(
              'created', (v) => v == null ? null : DateTime.parse(v as String)),
          chatType: $checkedConvert('chat_type',
              (v) => $enumDecodeNullable(_$ChatTypeEnumEnumMap, v)),
          newestMessage: $checkedConvert('newest_message', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'chatType': 'chat_type',
        'newestMessage': 'newest_message'
      },
    );

Map<String, dynamic> _$ChatRoomToJson(ChatRoom instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  writeNotNull('created', instance.created?.toIso8601String());
  writeNotNull('chat_type', _$ChatTypeEnumEnumMap[instance.chatType]);
  writeNotNull('newest_message', instance.newestMessage);
  return val;
}

const _$ChatTypeEnumEnumMap = {
  ChatTypeEnum.group: 'group',
  ChatTypeEnum.private: 'private',
};
