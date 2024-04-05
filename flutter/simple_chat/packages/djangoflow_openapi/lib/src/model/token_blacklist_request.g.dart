// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_blacklist_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TokenBlacklistRequestCWProxy {
  TokenBlacklistRequest refresh(String refresh);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokenBlacklistRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokenBlacklistRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TokenBlacklistRequest call({
    String? refresh,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTokenBlacklistRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTokenBlacklistRequest.copyWith.fieldName(...)`
class _$TokenBlacklistRequestCWProxyImpl
    implements _$TokenBlacklistRequestCWProxy {
  const _$TokenBlacklistRequestCWProxyImpl(this._value);

  final TokenBlacklistRequest _value;

  @override
  TokenBlacklistRequest refresh(String refresh) => this(refresh: refresh);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokenBlacklistRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokenBlacklistRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TokenBlacklistRequest call({
    Object? refresh = const $CopyWithPlaceholder(),
  }) {
    return TokenBlacklistRequest(
      refresh: refresh == const $CopyWithPlaceholder() || refresh == null
          ? _value.refresh
          // ignore: cast_nullable_to_non_nullable
          : refresh as String,
    );
  }
}

extension $TokenBlacklistRequestCopyWith on TokenBlacklistRequest {
  /// Returns a callable class that can be used as follows: `instanceOfTokenBlacklistRequest.copyWith(...)` or like so:`instanceOfTokenBlacklistRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TokenBlacklistRequestCWProxy get copyWith =>
      _$TokenBlacklistRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenBlacklistRequest _$TokenBlacklistRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TokenBlacklistRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['refresh'],
        );
        final val = TokenBlacklistRequest(
          refresh: $checkedConvert('refresh', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$TokenBlacklistRequestToJson(
        TokenBlacklistRequest instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
    };
