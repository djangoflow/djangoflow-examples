// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserRequestCWProxy {
  UserRequest firstName(String? firstName);

  UserRequest lastName(String? lastName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UserRequest call({
    String? firstName,
    String? lastName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserRequest.copyWith.fieldName(...)`
class _$UserRequestCWProxyImpl implements _$UserRequestCWProxy {
  const _$UserRequestCWProxyImpl(this._value);

  final UserRequest _value;

  @override
  UserRequest firstName(String? firstName) => this(firstName: firstName);

  @override
  UserRequest lastName(String? lastName) => this(lastName: lastName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  UserRequest call({
    Object? firstName = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
  }) {
    return UserRequest(
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
    );
  }
}

extension $UserRequestCopyWith on UserRequest {
  /// Returns a callable class that can be used as follows: `instanceOfUserRequest.copyWith(...)` or like so:`instanceOfUserRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserRequestCWProxy get copyWith => _$UserRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => $checkedCreate(
      'UserRequest',
      json,
      ($checkedConvert) {
        final val = UserRequest(
          firstName: $checkedConvert('first_name', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'firstName': 'first_name', 'lastName': 'last_name'},
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  return val;
}
