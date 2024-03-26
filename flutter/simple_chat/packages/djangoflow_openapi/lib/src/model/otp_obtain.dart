import 'package:copy_with_extension/copy_with_extension.dart';
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'otp_obtain.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OTPObtain {
  /// Returns a new [OTPObtain] instance.
  OTPObtain({

     this.username,

     this.email,

     this.phoneNumber,

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
    
    name: r'phone_number',
    required: false,
    includeIfNull: false
  )


  final String? phoneNumber;



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
  bool operator ==(Object other) => identical(this, other) || other is OTPObtain &&
     other.username == username &&
     other.email == email &&
     other.phoneNumber == phoneNumber &&
     other.otp == otp &&
     other.password == password;

  @override
  int get hashCode =>
    username.hashCode +
    email.hashCode +
    phoneNumber.hashCode +
    otp.hashCode +
    password.hashCode;

  factory OTPObtain.fromJson(Map<String, dynamic> json) => _$OTPObtainFromJson(json);

  Map<String, dynamic> toJson() => _$OTPObtainToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

