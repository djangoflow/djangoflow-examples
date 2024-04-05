// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user2_fa.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$User2FACWProxy {
  User2FA isRequired(bool? isRequired);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User2FA(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User2FA(...).copyWith(id: 12, name: "My name")
  /// ````
  User2FA call({
    bool? isRequired,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUser2FA.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUser2FA.copyWith.fieldName(...)`
class _$User2FACWProxyImpl implements _$User2FACWProxy {
  const _$User2FACWProxyImpl(this._value);

  final User2FA _value;

  @override
  User2FA isRequired(bool? isRequired) => this(isRequired: isRequired);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User2FA(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User2FA(...).copyWith(id: 12, name: "My name")
  /// ````
  User2FA call({
    Object? isRequired = const $CopyWithPlaceholder(),
  }) {
    return User2FA(
      isRequired: isRequired == const $CopyWithPlaceholder()
          ? _value.isRequired
          // ignore: cast_nullable_to_non_nullable
          : isRequired as bool?,
    );
  }
}

extension $User2FACopyWith on User2FA {
  /// Returns a callable class that can be used as follows: `instanceOfUser2FA.copyWith(...)` or like so:`instanceOfUser2FA.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$User2FACWProxy get copyWith => _$User2FACWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User2FA _$User2FAFromJson(Map<String, dynamic> json) => $checkedCreate(
      'User2FA',
      json,
      ($checkedConvert) {
        final val = User2FA(
          isRequired: $checkedConvert('is_required', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {'isRequired': 'is_required'},
    );

Map<String, dynamic> _$User2FAToJson(User2FA instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is_required', instance.isRequired);
  return val;
}
