// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_obtain_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TokenObtainRequestCWProxy {
  TokenObtainRequest otp(String? otp);

  TokenObtainRequest password(String? password);

  TokenObtainRequest username(String? username);

  TokenObtainRequest email(String? email);

  TokenObtainRequest phoneNumber(String? phoneNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokenObtainRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokenObtainRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TokenObtainRequest call({
    String? otp,
    String? password,
    String? username,
    String? email,
    String? phoneNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTokenObtainRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTokenObtainRequest.copyWith.fieldName(...)`
class _$TokenObtainRequestCWProxyImpl implements _$TokenObtainRequestCWProxy {
  const _$TokenObtainRequestCWProxyImpl(this._value);

  final TokenObtainRequest _value;

  @override
  TokenObtainRequest otp(String? otp) => this(otp: otp);

  @override
  TokenObtainRequest password(String? password) => this(password: password);

  @override
  TokenObtainRequest username(String? username) => this(username: username);

  @override
  TokenObtainRequest email(String? email) => this(email: email);

  @override
  TokenObtainRequest phoneNumber(String? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokenObtainRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokenObtainRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TokenObtainRequest call({
    Object? otp = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
  }) {
    return TokenObtainRequest(
      otp: otp == const $CopyWithPlaceholder()
          ? _value.otp
          // ignore: cast_nullable_to_non_nullable
          : otp as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
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
    );
  }
}

extension $TokenObtainRequestCopyWith on TokenObtainRequest {
  /// Returns a callable class that can be used as follows: `instanceOfTokenObtainRequest.copyWith(...)` or like so:`instanceOfTokenObtainRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TokenObtainRequestCWProxy get copyWith =>
      _$TokenObtainRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenObtainRequest _$TokenObtainRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TokenObtainRequest',
      json,
      ($checkedConvert) {
        final val = TokenObtainRequest(
          otp: $checkedConvert('otp', (v) => v as String?),
          password: $checkedConvert('password', (v) => v as String?),
          username: $checkedConvert('username', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'phoneNumber': 'phone_number'},
    );

Map<String, dynamic> _$TokenObtainRequestToJson(TokenObtainRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('otp', instance.otp);
  writeNotNull('password', instance.password);
  writeNotNull('username', instance.username);
  writeNotNull('email', instance.email);
  writeNotNull('phone_number', instance.phoneNumber);
  return val;
}
