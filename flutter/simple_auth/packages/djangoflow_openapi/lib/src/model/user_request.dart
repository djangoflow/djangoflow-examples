//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UserRequest {
  /// Returns a new [UserRequest] instance.
  UserRequest({

    required  this.email,

     this.firstName,

     this.lastName,

     this.password,

     this.phoneNumber,
  });

  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false
  )


  final String email;



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
    
    name: r'phone_number',
    required: false,
    includeIfNull: false
  )


  final String? phoneNumber;



  @override
  bool operator ==(Object other) => identical(this, other) || other is UserRequest &&
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

  factory UserRequest.fromJson(Map<String, dynamic> json) => _$UserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

