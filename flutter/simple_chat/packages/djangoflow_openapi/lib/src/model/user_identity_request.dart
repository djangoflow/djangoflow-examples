import 'package:copy_with_extension/copy_with_extension.dart';
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'user_identity_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserIdentityRequest {
  /// Returns a new [UserIdentityRequest] instance.
  UserIdentityRequest({

     this.firstName,

     this.lastName,

     this.password,

     this.username,

     this.email,

     this.phoneNumber,
  });

  @JsonKey(
    
    name: r'first_name',
    required: false,
    includeIfNull: false
  )


  final String? firstName;



  @JsonKey(
    
    name: r'last_name',
    required: false,
    includeIfNull: false
  )


  final String? lastName;



  @JsonKey(
    
    name: r'password',
    required: false,
    includeIfNull: false
  )


  final String? password;



  @JsonKey(
    
    name: r'username',
    required: false,
    includeIfNull: false
  )


  final String? username;



  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false
  )


  final String? email;



  @JsonKey(
    
    name: r'phone_number',
    required: false,
    includeIfNull: false
  )


  final String? phoneNumber;



  @override
  bool operator ==(Object other) => identical(this, other) || other is UserIdentityRequest &&
     other.firstName == firstName &&
     other.lastName == lastName &&
     other.password == password &&
     other.username == username &&
     other.email == email &&
     other.phoneNumber == phoneNumber;

  @override
  int get hashCode =>
    firstName.hashCode +
    lastName.hashCode +
    password.hashCode +
    username.hashCode +
    email.hashCode +
    phoneNumber.hashCode;

  factory UserIdentityRequest.fromJson(Map<String, dynamic> json) => _$UserIdentityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdentityRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

