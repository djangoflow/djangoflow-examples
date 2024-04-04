//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'user_signup.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserSignup {
  /// Returns a new [UserSignup] instance.
  UserSignup({
    required this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.phoneNumber,
  });

  @JsonKey(name: r'email', required: true, includeIfNull: false)
  final String email;

  @JsonKey(name: r'first_name', required: false, includeIfNull: false)
  final String? firstName;

  @JsonKey(name: r'last_name', required: false, includeIfNull: false)
  final String? lastName;

  @JsonKey(name: r'password', required: false, includeIfNull: false)
  final String? password;

  @JsonKey(name: r'phone_number', required: false, includeIfNull: false)
  final String? phoneNumber;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSignup &&
          other.email == email &&
          other.firstName == firstName &&
          other.lastName == lastName &&
          other.password == password &&
          other.phoneNumber == phoneNumber;

  @override
  int get hashCode =>
      email.hashCode +
      firstName.hashCode +
      lastName.hashCode +
      password.hashCode +
      phoneNumber.hashCode;

  factory UserSignup.fromJson(Map<String, dynamic> json) =>
      _$UserSignupFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignupToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
