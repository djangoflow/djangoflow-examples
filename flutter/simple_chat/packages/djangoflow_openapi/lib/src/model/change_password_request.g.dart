// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChangePasswordRequestCWProxy {
  ChangePasswordRequest oldPassword(String oldPassword);

  ChangePasswordRequest newPassword(String newPassword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChangePasswordRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChangePasswordRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChangePasswordRequest call({
    String? oldPassword,
    String? newPassword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChangePasswordRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChangePasswordRequest.copyWith.fieldName(...)`
class _$ChangePasswordRequestCWProxyImpl
    implements _$ChangePasswordRequestCWProxy {
  const _$ChangePasswordRequestCWProxyImpl(this._value);

  final ChangePasswordRequest _value;

  @override
  ChangePasswordRequest oldPassword(String oldPassword) =>
      this(oldPassword: oldPassword);

  @override
  ChangePasswordRequest newPassword(String newPassword) =>
      this(newPassword: newPassword);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChangePasswordRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChangePasswordRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChangePasswordRequest call({
    Object? oldPassword = const $CopyWithPlaceholder(),
    Object? newPassword = const $CopyWithPlaceholder(),
  }) {
    return ChangePasswordRequest(
      oldPassword:
          oldPassword == const $CopyWithPlaceholder() || oldPassword == null
              ? _value.oldPassword
              // ignore: cast_nullable_to_non_nullable
              : oldPassword as String,
      newPassword:
          newPassword == const $CopyWithPlaceholder() || newPassword == null
              ? _value.newPassword
              // ignore: cast_nullable_to_non_nullable
              : newPassword as String,
    );
  }
}

extension $ChangePasswordRequestCopyWith on ChangePasswordRequest {
  /// Returns a callable class that can be used as follows: `instanceOfChangePasswordRequest.copyWith(...)` or like so:`instanceOfChangePasswordRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChangePasswordRequestCWProxy get copyWith =>
      _$ChangePasswordRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordRequest _$ChangePasswordRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ChangePasswordRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['old_password', 'new_password'],
        );
        final val = ChangePasswordRequest(
          oldPassword: $checkedConvert('old_password', (v) => v as String),
          newPassword: $checkedConvert('new_password', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'oldPassword': 'old_password',
        'newPassword': 'new_password'
      },
    );

Map<String, dynamic> _$ChangePasswordRequestToJson(
        ChangePasswordRequest instance) =>
    <String, dynamic>{
      'old_password': instance.oldPassword,
      'new_password': instance.newPassword,
    };
