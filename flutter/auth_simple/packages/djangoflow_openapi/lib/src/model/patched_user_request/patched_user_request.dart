//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'patched_user_request.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PatchedUserRequest {
  /// Returns a new [PatchedUserRequest] instance.
  PatchedUserRequest({
    this.firstName,
    this.lastName,
    this.is2faEnabled,
  });

  @JsonKey(name: r'first_name', required: false, includeIfNull: false)
  final String? firstName;

  @JsonKey(name: r'last_name', required: false, includeIfNull: false)
  final String? lastName;

  @JsonKey(name: r'is_2fa_enabled', required: false, includeIfNull: false)
  final bool? is2faEnabled;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PatchedUserRequest &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.is2faEnabled == is2faEnabled;

  @override
  int get hashCode =>
      firstName.hashCode + lastName.hashCode + is2faEnabled.hashCode;

  factory PatchedUserRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PatchedUserRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
