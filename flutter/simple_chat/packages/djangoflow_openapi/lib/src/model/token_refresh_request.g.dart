// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_refresh_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TokenRefreshRequestCWProxy {
  TokenRefreshRequest refresh(String refresh);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokenRefreshRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokenRefreshRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TokenRefreshRequest call({
    String? refresh,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTokenRefreshRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTokenRefreshRequest.copyWith.fieldName(...)`
class _$TokenRefreshRequestCWProxyImpl implements _$TokenRefreshRequestCWProxy {
  const _$TokenRefreshRequestCWProxyImpl(this._value);

  final TokenRefreshRequest _value;

  @override
  TokenRefreshRequest refresh(String refresh) => this(refresh: refresh);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokenRefreshRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokenRefreshRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TokenRefreshRequest call({
    Object? refresh = const $CopyWithPlaceholder(),
  }) {
    return TokenRefreshRequest(
      refresh: refresh == const $CopyWithPlaceholder() || refresh == null
          ? _value.refresh
          // ignore: cast_nullable_to_non_nullable
          : refresh as String,
    );
  }
}

extension $TokenRefreshRequestCopyWith on TokenRefreshRequest {
  /// Returns a callable class that can be used as follows: `instanceOfTokenRefreshRequest.copyWith(...)` or like so:`instanceOfTokenRefreshRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TokenRefreshRequestCWProxy get copyWith =>
      _$TokenRefreshRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenRefreshRequest _$TokenRefreshRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TokenRefreshRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['refresh'],
        );
        final val = TokenRefreshRequest(
          refresh: $checkedConvert('refresh', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$TokenRefreshRequestToJson(
        TokenRefreshRequest instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
    };
