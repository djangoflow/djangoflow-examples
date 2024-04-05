// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_user2_fa_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PatchedUser2FARequestCWProxy {
  PatchedUser2FARequest isRequired(bool? isRequired);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PatchedUser2FARequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PatchedUser2FARequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PatchedUser2FARequest call({
    bool? isRequired,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPatchedUser2FARequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPatchedUser2FARequest.copyWith.fieldName(...)`
class _$PatchedUser2FARequestCWProxyImpl
    implements _$PatchedUser2FARequestCWProxy {
  const _$PatchedUser2FARequestCWProxyImpl(this._value);

  final PatchedUser2FARequest _value;

  @override
  PatchedUser2FARequest isRequired(bool? isRequired) =>
      this(isRequired: isRequired);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PatchedUser2FARequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PatchedUser2FARequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PatchedUser2FARequest call({
    Object? isRequired = const $CopyWithPlaceholder(),
  }) {
    return PatchedUser2FARequest(
      isRequired: isRequired == const $CopyWithPlaceholder()
          ? _value.isRequired
          // ignore: cast_nullable_to_non_nullable
          : isRequired as bool?,
    );
  }
}

extension $PatchedUser2FARequestCopyWith on PatchedUser2FARequest {
  /// Returns a callable class that can be used as follows: `instanceOfPatchedUser2FARequest.copyWith(...)` or like so:`instanceOfPatchedUser2FARequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PatchedUser2FARequestCWProxy get copyWith =>
      _$PatchedUser2FARequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchedUser2FARequest _$PatchedUser2FARequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PatchedUser2FARequest',
      json,
      ($checkedConvert) {
        final val = PatchedUser2FARequest(
          isRequired: $checkedConvert('is_required', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {'isRequired': 'is_required'},
    );

Map<String, dynamic> _$PatchedUser2FARequestToJson(
    PatchedUser2FARequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is_required', instance.isRequired);
  return val;
}
