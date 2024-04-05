import 'package:copy_with_extension/copy_with_extension.dart';
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:djangoflow_openapi/src/model/provider_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'social_token_obtain_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SocialTokenObtainRequest {
  /// Returns a new [SocialTokenObtainRequest] instance.
  SocialTokenObtainRequest({

    required  this.accessToken,

    required  this.provider,

     this.firstName,

     this.lastName,

     this.otp,

     this.password,
  });

  @JsonKey(
    
    name: r'access_token',
    required: true,
    includeIfNull: false
  )


  final String accessToken;



  @JsonKey(
    
    name: r'provider',
    required: true,
    includeIfNull: false
  )


  final ProviderEnum provider;



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
  bool operator ==(Object other) => identical(this, other) || other is SocialTokenObtainRequest &&
     other.accessToken == accessToken &&
     other.provider == provider &&
     other.firstName == firstName &&
     other.lastName == lastName &&
     other.otp == otp &&
     other.password == password;

  @override
  int get hashCode =>
    accessToken.hashCode +
    provider.hashCode +
    firstName.hashCode +
    lastName.hashCode +
    otp.hashCode +
    password.hashCode;

  factory SocialTokenObtainRequest.fromJson(Map<String, dynamic> json) => _$SocialTokenObtainRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SocialTokenObtainRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

