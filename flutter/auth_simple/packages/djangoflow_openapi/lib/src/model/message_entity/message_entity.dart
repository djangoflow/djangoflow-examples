//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

import '../member_entity/member_entity.dart';

part 'message_entity.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MessageEntity {
  /// Returns a new [MessageEntity] instance.
  MessageEntity({
    required this.id,
    required this.created,
    required this.modified,
    required this.message,
    required this.createdBy,
    required this.chatRoom,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: r'created', required: true, includeIfNull: false)
  final DateTime created;

  @JsonKey(name: r'modified', required: true, includeIfNull: false)
  final DateTime modified;

  @JsonKey(name: r'message', required: true, includeIfNull: false)
  final String message;

  @JsonKey(name: r'chat_room', required: true, includeIfNull: false)
  final int chatRoom;

  @JsonKey(name: r'created_by', required: true, includeIfNull: false)
  final MemberEntity createdBy;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageEntity &&
          other.message == message &&
          other.id == id &&
          other.modified == modified &&
          other.created == created &&
          other.createdBy == createdBy;

  @override
  int get hashCode =>
      message.hashCode +
      created.hashCode +
      createdBy.hashCode +
      id.hashCode +
      modified.hashCode;

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
