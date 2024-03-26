// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_obtain_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$OTPObtainRequestCWProxy {
  OTPObtainRequest username(String? username);

  OTPObtainRequest email(String? email);

  OTPObtainRequest phoneNumber(String? phoneNumber);

  OTPObtainRequest otp(String? otp);

  OTPObtainRequest password(String? password);

  OTPObtainRequest redirectPath(String? redirectPath);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OTPObtainRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OTPObtainRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  OTPObtainRequest call({
    String? username,
    String? email,
    String? phoneNumber,
    String? otp,
    String? password,
    String? redirectPath,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOTPObtainRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOTPObtainRequest.copyWith.fieldName(...)`
class _$OTPObtainRequestCWProxyImpl implements _$OTPObtainRequestCWProxy {
  const _$OTPObtainRequestCWProxyImpl(this._value);

  final OTPObtainRequest _value;

  @override
  OTPObtainRequest username(String? username) => this(username: username);

  @override
  OTPObtainRequest email(String? email) => this(email: email);

  @override
  OTPObtainRequest phoneNumber(String? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override
  OTPObtainRequest otp(String? otp) => this(otp: otp);

  @override
  OTPObtainRequest password(String? password) => this(password: password);

  @override
  OTPObtainRequest redirectPath(String? redirectPath) =>
      this(redirectPath: redirectPath);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OTPObtainRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OTPObtainRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  OTPObtainRequest call({
    Object? username = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? otp = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? redirectPath = const $CopyWithPlaceholder(),
  }) {
    return OTPObtainRequest(
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
      redirectPath: redirectPath == const $CopyWithPlaceholder()
          ? _value.redirectPath
          // ignore: cast_nullable_to_non_nullable
          : redirectPath as String?,
    );
  }
}

extension $OTPObtainRequestCopyWith on OTPObtainRequest {
  /// Returns a callable class that can be used as follows: `instanceOfOTPObtainRequest.copyWith(...)` or like so:`instanceOfOTPObtainRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OTPObtainRequestCWProxy get copyWith => _$OTPObtainRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OTPObtainRequest _$OTPObtainRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'OTPObtainRequest',
      json,
      ($checkedConvert) {
        final val = OTPObtainRequest(
          username: $checkedConvert('username', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String?),
          otp: $checkedConvert('otp', (v) => v as String?),
          password: $checkedConvert('password', (v) => v as String?),
          redirectPath: $checkedConvert('redirect_path', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'phoneNumber': 'phone_number',
        'redirectPath': 'redirect_path'
      },
    );

Map<String, dynamic> _$OTPObtainRequestToJson(OTPObtainRequest instance) {
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
  writeNotNull('redirect_path', instance.redirectPath);
  return val;
}
