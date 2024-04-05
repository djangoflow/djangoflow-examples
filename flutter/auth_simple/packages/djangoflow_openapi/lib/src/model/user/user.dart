//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class User {
  /// Returns a new [User] instance.
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.is2faEnabled,
  });

  @JsonKey(name: r'id', required: false, includeIfNull: false)
  final int? id;

  @JsonKey(name: r'first_name', required: false, includeIfNull: false)
  final String? firstName;

  @JsonKey(name: r'last_name', required: false, includeIfNull: false)
  final String? lastName;

  @JsonKey(name: r'is_2fa_enabled', required: false, includeIfNull: false)
  final bool? is2faEnabled;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          other.id == id &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.is2faEnabled == is2faEnabled;

  @override
  int get hashCode =>
      id.hashCode +
      firstName.hashCode +
      lastName.hashCode +
      is2faEnabled.hashCode;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
