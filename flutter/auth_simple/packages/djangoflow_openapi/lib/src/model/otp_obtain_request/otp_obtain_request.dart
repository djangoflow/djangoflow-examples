//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'otp_obtain_request.g.dart';


@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OTPObtainRequest {
  /// Returns a new [OTPObtainRequest] instance.
  OTPObtainRequest({

     this.username,

     this.email,

     this.otp,

     this.password,
  });

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



  @override
  bool operator ==(Object other) => identical(this, other) || other is OTPObtainRequest &&
     other.username == username &&
     other.email == email &&
     other.otp == otp &&
     other.password == password;

  @override
  int get hashCode =>
    username.hashCode +
    email.hashCode +
    otp.hashCode +
    password.hashCode;

  factory OTPObtainRequest.fromJson(Map<String, dynamic> json) => _$OTPObtainRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OTPObtainRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

