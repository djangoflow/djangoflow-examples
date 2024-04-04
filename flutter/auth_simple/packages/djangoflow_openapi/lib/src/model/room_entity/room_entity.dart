import 'package:json_annotation/json_annotation.dart';

import '../../enums/room_type.dart';

part 'room_entity.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RoomEntity {
  /// Returns a new [RoomEntity] instance.
  const RoomEntity({
    required this.id,
    required this.title,
    required this.chatType,
    required this.created,
    this.newestMessage,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: r'title', required: true, includeIfNull: false)
  final String title;

  @JsonKey(name: r'created', required: true, includeIfNull: false)
  final DateTime created;

  @JsonKey(name: r'chat_type', required: true, includeIfNull: false)
  final RoomType chatType;

  @JsonKey(name: r'newest_message', required: false, includeIfNull: false)
  final String? newestMessage;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoomEntity &&
          other.id == id &&
          other.title == title &&
          other.created == created &&
          other.newestMessage == newestMessage &&
          other.chatType == chatType;

  @override
  int get hashCode =>
      id.hashCode +
      title.hashCode +
      created.hashCode +
      newestMessage.hashCode +
      chatType.hashCode;

  factory RoomEntity.fromJson(Map<String, dynamic> json) =>
      _$RoomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RoomEntityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
