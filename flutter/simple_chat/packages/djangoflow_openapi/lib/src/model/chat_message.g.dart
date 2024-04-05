// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatMessageCWProxy {
  ChatMessage id(int? id);

  ChatMessage created(DateTime? created);

  ChatMessage modified(DateTime? modified);

  ChatMessage chatRoom(int? chatRoom);

  ChatMessage createdBy(User? createdBy);

  ChatMessage message(String message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessage(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessage call({
    int? id,
    DateTime? created,
    DateTime? modified,
    int? chatRoom,
    User? createdBy,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatMessage.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatMessage.copyWith.fieldName(...)`
class _$ChatMessageCWProxyImpl implements _$ChatMessageCWProxy {
  const _$ChatMessageCWProxyImpl(this._value);

  final ChatMessage _value;

  @override
  ChatMessage id(int? id) => this(id: id);

  @override
  ChatMessage created(DateTime? created) => this(created: created);

  @override
  ChatMessage modified(DateTime? modified) => this(modified: modified);

  @override
  ChatMessage chatRoom(int? chatRoom) => this(chatRoom: chatRoom);

  @override
  ChatMessage createdBy(User? createdBy) => this(createdBy: createdBy);

  @override
  ChatMessage message(String message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessage(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessage(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessage call({
    Object? id = const $CopyWithPlaceholder(),
    Object? created = const $CopyWithPlaceholder(),
    Object? modified = const $CopyWithPlaceholder(),
    Object? chatRoom = const $CopyWithPlaceholder(),
    Object? createdBy = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return ChatMessage(
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
      chatRoom: chatRoom == const $CopyWithPlaceholder()
          ? _value.chatRoom
          // ignore: cast_nullable_to_non_nullable
          : chatRoom as int?,
      createdBy: createdBy == const $CopyWithPlaceholder()
          ? _value.createdBy
          // ignore: cast_nullable_to_non_nullable
          : createdBy as User?,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $ChatMessageCopyWith on ChatMessage {
  /// Returns a callable class that can be used as follows: `instanceOfChatMessage.copyWith(...)` or like so:`instanceOfChatMessage.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatMessageCWProxy get copyWith => _$ChatMessageCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ChatMessage',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message'],
        );
        final val = ChatMessage(
          id: $checkedConvert('id', (v) => v as int?),
          created: $checkedConvert(
              'created', (v) => v == null ? null : DateTime.parse(v as String)),
          modified: $checkedConvert('modified',
              (v) => v == null ? null : DateTime.parse(v as String)),
          chatRoom: $checkedConvert('chat_room', (v) => v as int?),
          createdBy: $checkedConvert(
              'created_by',
              (v) =>
                  v == null ? null : User.fromJson(v as Map<String, dynamic>)),
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'chatRoom': 'chat_room', 'createdBy': 'created_by'},
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('created', instance.created?.toIso8601String());
  writeNotNull('modified', instance.modified?.toIso8601String());
  writeNotNull('chat_room', instance.chatRoom);
  writeNotNull('created_by', instance.createdBy?.toJson());
  val['message'] = instance.message;
  return val;
}
