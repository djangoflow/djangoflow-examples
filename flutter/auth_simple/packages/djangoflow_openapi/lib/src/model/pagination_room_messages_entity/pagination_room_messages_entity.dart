import 'package:djangoflow_openapi/src/model/message_entity/message_entity.dart';
import 'package:json_annotation/json_annotation.dart';


part 'pagination_room_messages_entity.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaginationRoomMessagesEntity {
  /// Returns a new [PaginationRoomMessagesEntity] instance.
  PaginationRoomMessagesEntity({
    required this.results,
    this.count,
    this.next,
    this.previous,
  });

  @JsonKey(name: r'count', required: false, includeIfNull: false)
  final int? count;

  @JsonKey(name: r'next', required: false, includeIfNull: false)
  final String? next;

  @JsonKey(name: r'previous', required: false, includeIfNull: false)
  final String? previous;

  @JsonKey(name: r'results', required: true, includeIfNull: false)
  final List<MessageEntity> results;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationRoomMessagesEntity &&
          other.count == count &&
          other.next == next &&
          other.previous == previous &&
          other.results == results;

  @override
  int get hashCode =>
      count.hashCode +
      (next == null ? 0 : next.hashCode) +
      (previous == null ? 0 : previous.hashCode) +
      results.hashCode;

  factory PaginationRoomMessagesEntity.fromJson(Map<String, dynamic> json) =>
      _$PaginationRoomMessagesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRoomMessagesEntityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
