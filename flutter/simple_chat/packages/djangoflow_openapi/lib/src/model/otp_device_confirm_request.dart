import 'package:copy_with_extension/copy_with_extension.dart';
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'otp_device_confirm_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OTPDeviceConfirmRequest {
  /// Returns a new [OTPDeviceConfirmRequest] instance.
  OTPDeviceConfirmRequest({

    required  this.otp,
  });

  @JsonKey(
    
    name: r'otp',
    required: true,
    includeIfNull: false
  )


  final String otp;



  @override
  bool operator ==(Object other) => identical(this, other) || other is OTPDeviceConfirmRequest &&
     other.otp == otp;

  @override
  int get hashCode =>
    otp.hashCode;

  factory OTPDeviceConfirmRequest.fromJson(Map<String, dynamic> json) => _$OTPDeviceConfirmRequestFromJson(json);

  Map<String, dynamic> toJson() => _$OTPDeviceConfirmRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

