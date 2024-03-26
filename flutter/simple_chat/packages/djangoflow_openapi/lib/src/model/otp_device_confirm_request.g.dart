// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_device_confirm_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OTPDeviceConfirmRequestCWProxy {
  OTPDeviceConfirmRequest otp(String otp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OTPDeviceConfirmRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OTPDeviceConfirmRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  OTPDeviceConfirmRequest call({
    String? otp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOTPDeviceConfirmRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOTPDeviceConfirmRequest.copyWith.fieldName(...)`
class _$OTPDeviceConfirmRequestCWProxyImpl
    implements _$OTPDeviceConfirmRequestCWProxy {
  const _$OTPDeviceConfirmRequestCWProxyImpl(this._value);

  final OTPDeviceConfirmRequest _value;

  @override
  OTPDeviceConfirmRequest otp(String otp) => this(otp: otp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OTPDeviceConfirmRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OTPDeviceConfirmRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  OTPDeviceConfirmRequest call({
    Object? otp = const $CopyWithPlaceholder(),
  }) {
    return OTPDeviceConfirmRequest(
      otp: otp == const $CopyWithPlaceholder() || otp == null
          ? _value.otp
          // ignore: cast_nullable_to_non_nullable
          : otp as String,
    );
  }
}

extension $OTPDeviceConfirmRequestCopyWith on OTPDeviceConfirmRequest {
  /// Returns a callable class that can be used as follows: `instanceOfOTPDeviceConfirmRequest.copyWith(...)` or like so:`instanceOfOTPDeviceConfirmRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OTPDeviceConfirmRequestCWProxy get copyWith =>
      _$OTPDeviceConfirmRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPDeviceConfirmRequest _$OTPDeviceConfirmRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'OTPDeviceConfirmRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['otp'],
        );
        final val = OTPDeviceConfirmRequest(
          otp: $checkedConvert('otp', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$OTPDeviceConfirmRequestToJson(
        OTPDeviceConfirmRequest instance) =>
    <String, dynamic>{
      'otp': instance.otp,
    };
