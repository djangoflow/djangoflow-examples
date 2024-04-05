// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_device_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OTPDeviceRequestCWProxy {
  OTPDeviceRequest name(String? name);

  OTPDeviceRequest type(TypeEnum type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OTPDeviceRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OTPDeviceRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  OTPDeviceRequest call({
    String? name,
    TypeEnum? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOTPDeviceRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOTPDeviceRequest.copyWith.fieldName(...)`
class _$OTPDeviceRequestCWProxyImpl implements _$OTPDeviceRequestCWProxy {
  const _$OTPDeviceRequestCWProxyImpl(this._value);

  final OTPDeviceRequest _value;

  @override
  OTPDeviceRequest name(String? name) => this(name: name);

  @override
  OTPDeviceRequest type(TypeEnum type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OTPDeviceRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OTPDeviceRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  OTPDeviceRequest call({
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return OTPDeviceRequest(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as TypeEnum,
    );
  }
}

extension $OTPDeviceRequestCopyWith on OTPDeviceRequest {
  /// Returns a callable class that can be used as follows: `instanceOfOTPDeviceRequest.copyWith(...)` or like so:`instanceOfOTPDeviceRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OTPDeviceRequestCWProxy get copyWith => _$OTPDeviceRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPDeviceRequest _$OTPDeviceRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'OTPDeviceRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['type'],
        );
        final val = OTPDeviceRequest(
          name: $checkedConvert('name', (v) => v as String?),
          type:
              $checkedConvert('type', (v) => $enumDecode(_$TypeEnumEnumMap, v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$OTPDeviceRequestToJson(OTPDeviceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['type'] = _$TypeEnumEnumMap[instance.type]!;
  return val;
}

const _$TypeEnumEnumMap = {
  TypeEnum.email: 'email',
  TypeEnum.totp: 'totp',
  TypeEnum.sms: 'sms',
};
