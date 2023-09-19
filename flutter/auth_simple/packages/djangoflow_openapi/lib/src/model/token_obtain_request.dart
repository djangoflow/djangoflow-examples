//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'token_obtain_request.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TokenObtainRequest {
  /// Returns a new [TokenObtainRequest] instance.
  TokenObtainRequest({

     this.otp,

     this.password,

     this.username,

     this.email,
  });

  @JsonKey(
    
    name: r'otp',
    required: false,
    includeIfNull: false
  )


  final String? otp;



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



  @override
  bool operator ==(Object other) => identical(this, other) || other is TokenObtainRequest &&
     other.otp == otp &&
     other.password == password &&
     other.username == username &&
     other.email == email;

  @override
  int get hashCode =>
    otp.hashCode +
    password.hashCode +
    username.hashCode +
    email.hashCode;

  factory TokenObtainRequest.fromJson(Map<String, dynamic> json) => _$TokenObtainRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TokenObtainRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

