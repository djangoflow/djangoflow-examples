//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'member_entity.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MemberEntity {
  /// Returns a new [MemberEntity] instance.
  MemberEntity({
    required this.id,
    this.firstName,
    this.lastLame,
  });

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final int id;

  @JsonKey(name: r'first_name', required: false, includeIfNull: false)
  final String? firstName;

  @JsonKey(name: r'email', required: false, includeIfNull: false)
  final String? lastLame;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberEntity &&
          other.id == id &&
          other.firstName == firstName &&
          other.lastLame == lastLame;

  @override
  int get hashCode => id.hashCode + firstName.hashCode + lastLame.hashCode;

  factory MemberEntity.fromJson(Map<String, dynamic> json) =>
      _$MemberEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MemberEntityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
