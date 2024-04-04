import 'package:json_annotation/json_annotation.dart';

import '../room_entity/room_entity.dart';

part 'pagination_rooms_entity.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaginationRoomsEntity {
  /// Returns a new [PaginationRoomsEntity] instance.
  PaginationRoomsEntity({
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
  final List<RoomEntity> results;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationRoomsEntity &&
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

  factory PaginationRoomsEntity.fromJson(Map<String, dynamic> json) =>
      _$PaginationRoomsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRoomsEntityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
