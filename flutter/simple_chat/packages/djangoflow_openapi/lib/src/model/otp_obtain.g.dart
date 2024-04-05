// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_obtain.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OTPObtainCWProxy {
  OTPObtain username(String? username);

  OTPObtain email(String? email);

  OTPObtain phoneNumber(String? phoneNumber);

  OTPObtain otp(String? otp);

  OTPObtain password(String? password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OTPObtain(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OTPObtain(...).copyWith(id: 12, name: "My name")
  /// ````
  OTPObtain call({
    String? username,
    String? email,
    String? phoneNumber,
    String? otp,
    String? password,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOTPObtain.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOTPObtain.copyWith.fieldName(...)`
class _$OTPObtainCWProxyImpl implements _$OTPObtainCWProxy {
  const _$OTPObtainCWProxyImpl(this._value);

  final OTPObtain _value;

  @override
  OTPObtain username(String? username) => this(username: username);

  @override
  OTPObtain email(String? email) => this(email: email);

  @override
  OTPObtain phoneNumber(String? phoneNumber) => this(phoneNumber: phoneNumber);

  @override
  OTPObtain otp(String? otp) => this(otp: otp);

  @override
  OTPObtain password(String? password) => this(password: password);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OTPObtain(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OTPObtain(...).copyWith(id: 12, name: "My name")
  /// ````
  OTPObtain call({
    Object? username = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? otp = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return OTPObtain(
      username: username == const $CopyWithPlaceholder()
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
      otp: otp == const $CopyWithPlaceholder()
          ? _value.otp
          // ignore: cast_nullable_to_non_nullable
          : otp as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
    );
  }
}

extension $OTPObtainCopyWith on OTPObtain {
  /// Returns a callable class that can be used as follows: `instanceOfOTPObtain.copyWith(...)` or like so:`instanceOfOTPObtain.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OTPObtainCWProxy get copyWith => _$OTPObtainCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPObtain _$OTPObtainFromJson(Map<String, dynamic> json) => $checkedCreate(
      'OTPObtain',
      json,
      ($checkedConvert) {
        final val = OTPObtain(
          username: $checkedConvert('username', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String?),
          otp: $checkedConvert('otp', (v) => v as String?),
          password: $checkedConvert('password', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'phoneNumber': 'phone_number'},
    );

Map<String, dynamic> _$OTPObtainToJson(OTPObtain instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username);
  writeNotNull('email', instance.email);
  writeNotNull('phone_number', instance.phoneNumber);
  writeNotNull('otp', instance.otp);
  writeNotNull('password', instance.password);
  return val;
}
