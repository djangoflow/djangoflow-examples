// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_identity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserIdentityCWProxy {
  UserIdentity firstName(String? firstName);

  UserIdentity lastName(String? lastName);

  UserIdentity username(String? username);

  UserIdentity email(String? email);

  UserIdentity phoneNumber(String? phoneNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserIdentity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserIdentity(...).copyWith(id: 12, name: "My name")
  /// ````
  UserIdentity call({
    String? firstName,
    String? lastName,
    String? username,
    String? email,
    String? phoneNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserIdentity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserIdentity.copyWith.fieldName(...)`
class _$UserIdentityCWProxyImpl implements _$UserIdentityCWProxy {
  const _$UserIdentityCWProxyImpl(this._value);

  final UserIdentity _value;

  @override
  UserIdentity firstName(String? firstName) => this(firstName: firstName);

  @override
  UserIdentity lastName(String? lastName) => this(lastName: lastName);

  @override
  UserIdentity username(String? username) => this(username: username);

  @override
  UserIdentity email(String? email) => this(email: email);

  @override
  UserIdentity phoneNumber(String? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserIdentity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserIdentity(...).copyWith(id: 12, name: "My name")
  /// ````
  UserIdentity call({
    Object? firstName = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
  }) {
    return UserIdentity(
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
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

extension $UserIdentityCopyWith on UserIdentity {
  /// Returns a callable class that can be used as follows: `instanceOfUserIdentity.copyWith(...)` or like so:`instanceOfUserIdentity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserIdentityCWProxy get copyWith => _$UserIdentityCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserIdentity _$UserIdentityFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'UserIdentity',
      json,
      ($checkedConvert) {
        final val = UserIdentity(
          firstName: $checkedConvert('first_name', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
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

Map<String, dynamic> _$UserIdentityToJson(UserIdentity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('username', instance.username);
  writeNotNull('email', instance.email);
  writeNotNull('phone_number', instance.phoneNumber);
  return val;
}
