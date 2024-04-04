import 'package:json_annotation/json_annotation.dart';

import '../member_entity/member_entity.dart';

part 'pagination_room_members_entity.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaginationRoomMembersEntity {
  /// Returns a new [PaginationRoomMembersEntity] instance.
  PaginationRoomMembersEntity({
    required this.members,
  });

  @JsonKey(name: r'members', required: true, includeIfNull: false)
  final List<MemberEntity> members;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaginationRoomMembersEntity && other.members == members;

  @override
  int get hashCode => members.hashCode;

  factory PaginationRoomMembersEntity.fromJson(Map<String, dynamic> json) =>
      _$PaginationRoomMembersEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRoomMembersEntityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
