// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_identity_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserIdentityRequestCWProxy {
  UserIdentityRequest firstName(String? firstName);

  UserIdentityRequest lastName(String? lastName);

  UserIdentityRequest password(String? password);

  UserIdentityRequest username(String? username);

  UserIdentityRequest email(String? email);

  UserIdentityRequest phoneNumber(String? phoneNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserIdentityRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserIdentityRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UserIdentityRequest call({
    String? firstName,
    String? lastName,
    String? password,
    String? username,
    String? email,
    String? phoneNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserIdentityRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserIdentityRequest.copyWith.fieldName(...)`
class _$UserIdentityRequestCWProxyImpl implements _$UserIdentityRequestCWProxy {
  const _$UserIdentityRequestCWProxyImpl(this._value);

  final UserIdentityRequest _value;

  @override
  UserIdentityRequest firstName(String? firstName) =>
      this(firstName: firstName);

  @override
  UserIdentityRequest lastName(String? lastName) => this(lastName: lastName);

  @override
  UserIdentityRequest password(String? password) => this(password: password);

  @override
  UserIdentityRequest username(String? username) => this(username: username);

  @override
  UserIdentityRequest email(String? email) => this(email: email);

  @override
  UserIdentityRequest phoneNumber(String? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserIdentityRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserIdentityRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UserIdentityRequest call({
    Object? firstName = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
  }) {
    return UserIdentityRequest(
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
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

extension $UserIdentityRequestCopyWith on UserIdentityRequest {
  /// Returns a callable class that can be used as follows: `instanceOfUserIdentityRequest.copyWith(...)` or like so:`instanceOfUserIdentityRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserIdentityRequestCWProxy get copyWith =>
      _$UserIdentityRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserIdentityRequest _$UserIdentityRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UserIdentityRequest',
      json,
      ($checkedConvert) {
        final val = UserIdentityRequest(
          firstName: $checkedConvert('first_name', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
          password: $checkedConvert('password', (v) => v as String?),
          username: $checkedConvert('username', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'firstName': 'first_name',
        'lastName': 'last_name',
        'phoneNumber': 'phone_number'
      },
    );

Map<String, dynamic> _$UserIdentityRequestToJson(UserIdentityRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('password', instance.password);
  writeNotNull('username', instance.username);
  writeNotNull('email', instance.email);
  writeNotNull('phone_number', instance.phoneNumber);
  return val;
}
