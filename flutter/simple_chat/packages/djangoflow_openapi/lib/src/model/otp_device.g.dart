// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_device.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OTPDeviceCWProxy {
  OTPDevice id(int? id);

  OTPDevice name(String? name);

  OTPDevice type(TypeEnum type);

  OTPDevice confirmed(bool? confirmed);

  OTPDevice extraData(Map<String, String>? extraData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OTPDevice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OTPDevice(...).copyWith(id: 12, name: "My name")
  /// ````
  OTPDevice call({
    int? id,
    String? name,
    TypeEnum? type,
    bool? confirmed,
    Map<String, String>? extraData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOTPDevice.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOTPDevice.copyWith.fieldName(...)`
class _$OTPDeviceCWProxyImpl implements _$OTPDeviceCWProxy {
  const _$OTPDeviceCWProxyImpl(this._value);

  final OTPDevice _value;

  @override
  OTPDevice id(int? id) => this(id: id);

  @override
  OTPDevice name(String? name) => this(name: name);

  @override
  OTPDevice type(TypeEnum type) => this(type: type);

  @override
  OTPDevice confirmed(bool? confirmed) => this(confirmed: confirmed);

  @override
  OTPDevice extraData(Map<String, String>? extraData) =>
      this(extraData: extraData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OTPDevice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OTPDevice(...).copyWith(id: 12, name: "My name")
  /// ````
  OTPDevice call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? confirmed = const $CopyWithPlaceholder(),
    Object? extraData = const $CopyWithPlaceholder(),
  }) {
    return OTPDevice(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      type: type == const $CopyWithPlaceholder() || type == null
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as TypeEnum,
      confirmed: confirmed == const $CopyWithPlaceholder()
          ? _value.confirmed
          // ignore: cast_nullable_to_non_nullable
          : confirmed as bool?,
      extraData: extraData == const $CopyWithPlaceholder()
          ? _value.extraData
          // ignore: cast_nullable_to_non_nullable
          : extraData as Map<String, String>?,
    );
  }
}

extension $OTPDeviceCopyWith on OTPDevice {
  /// Returns a callable class that can be used as follows: `instanceOfOTPDevice.copyWith(...)` or like so:`instanceOfOTPDevice.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OTPDeviceCWProxy get copyWith => _$OTPDeviceCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPDevice _$OTPDeviceFromJson(Map<String, dynamic> json) => $checkedCreate(
      'OTPDevice',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['type'],
        );
        final val = OTPDevice(
          id: $checkedConvert('id', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as String?),
          type:
              $checkedConvert('type', (v) => $enumDecode(_$TypeEnumEnumMap, v)),
          confirmed: $checkedConvert('confirmed', (v) => v as bool?),
          extraData: $checkedConvert(
              'extra_data',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as String),
                  )),
        );
        return val;
      },
      fieldKeyMap: const {'extraData': 'extra_data'},
    );

Map<String, dynamic> _$OTPDeviceToJson(OTPDevice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  val['type'] = _$TypeEnumEnumMap[instance.type]!;
  writeNotNull('confirmed', instance.confirmed);
  writeNotNull('extra_data', instance.extraData);
  return val;
}

const _$TypeEnumEnumMap = {
  TypeEnum.email: 'email',
  TypeEnum.totp: 'totp',
  TypeEnum.sms: 'sms',
};
