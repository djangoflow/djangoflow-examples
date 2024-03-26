// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_update.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatMessageUpdateCWProxy {
  ChatMessageUpdate id(int? id);

  ChatMessageUpdate created(DateTime? created);

  ChatMessageUpdate modified(DateTime? modified);

  ChatMessageUpdate message(String message);

  ChatMessageUpdate chatRoom(int? chatRoom);

  ChatMessageUpdate createdBy(int? createdBy);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessageUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessageUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessageUpdate call({
    int? id,
    DateTime? created,
    DateTime? modified,
    String? message,
    int? chatRoom,
    int? createdBy,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatMessageUpdate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatMessageUpdate.copyWith.fieldName(...)`
class _$ChatMessageUpdateCWProxyImpl implements _$ChatMessageUpdateCWProxy {
  const _$ChatMessageUpdateCWProxyImpl(this._value);

  final ChatMessageUpdate _value;

  @override
  ChatMessageUpdate id(int? id) => this(id: id);

  @override
  ChatMessageUpdate created(DateTime? created) => this(created: created);

  @override
  ChatMessageUpdate modified(DateTime? modified) => this(modified: modified);

  @override
  ChatMessageUpdate message(String message) => this(message: message);

  @override
  ChatMessageUpdate chatRoom(int? chatRoom) => this(chatRoom: chatRoom);

  @override
  ChatMessageUpdate createdBy(int? createdBy) => this(createdBy: createdBy);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessageUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessageUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessageUpdate call({
    Object? id = const $CopyWithPlaceholder(),
    Object? created = const $CopyWithPlaceholder(),
    Object? modified = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? chatRoom = const $CopyWithPlaceholder(),
    Object? createdBy = const $CopyWithPlaceholder(),
  }) {
    return ChatMessageUpdate(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      created: created == const $CopyWithPlaceholder()
          ? _value.created
          // ignore: cast_nullable_to_non_nullable
          : created as DateTime?,
      modified: modified == const $CopyWithPlaceholder()
          ? _value.modified
          // ignore: cast_nullable_to_non_nullable
          : modified as DateTime?,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      chatRoom: chatRoom == const $CopyWithPlaceholder()
          ? _value.chatRoom
          // ignore: cast_nullable_to_non_nullable
          : chatRoom as int?,
      createdBy: createdBy == const $CopyWithPlaceholder()
          ? _value.createdBy
          // ignore: cast_nullable_to_non_nullable
          : createdBy as int?,
    );
  }
}

extension $ChatMessageUpdateCopyWith on ChatMessageUpdate {
  /// Returns a callable class that can be used as follows: `instanceOfChatMessageUpdate.copyWith(...)` or like so:`instanceOfChatMessageUpdate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatMessageUpdateCWProxy get copyWith =>
      _$ChatMessageUpdateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageUpdate _$ChatMessageUpdateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ChatMessageUpdate',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message'],
        );
        final val = ChatMessageUpdate(
          id: $checkedConvert('id', (v) => v as int?),
          created: $checkedConvert(
              'created', (v) => v == null ? null : DateTime.parse(v as String)),
          modified: $checkedConvert('modified',
              (v) => v == null ? null : DateTime.parse(v as String)),
          message: $checkedConvert('message', (v) => v as String),
          chatRoom: $checkedConvert('chat_room', (v) => v as int?),
          createdBy: $checkedConvert('created_by', (v) => v as int?),
        );
        return val;
      },
      fieldKeyMap: const {'chatRoom': 'chat_room', 'createdBy': 'created_by'},
    );

Map<String, dynamic> _$ChatMessageUpdateToJson(ChatMessageUpdate instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('created', instance.created?.toIso8601String());
  writeNotNull('modified', instance.modified?.toIso8601String());
  val['message'] = instance.message;
  writeNotNull('chat_room', instance.chatRoom);
  writeNotNull('created_by', instance.createdBy);
  return val;
}
