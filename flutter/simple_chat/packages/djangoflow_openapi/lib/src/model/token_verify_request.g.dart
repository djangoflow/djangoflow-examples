// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_verify_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TokenVerifyRequestCWProxy {
  TokenVerifyRequest token(String token);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokenVerifyRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokenVerifyRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TokenVerifyRequest call({
    String? token,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTokenVerifyRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTokenVerifyRequest.copyWith.fieldName(...)`
class _$TokenVerifyRequestCWProxyImpl implements _$TokenVerifyRequestCWProxy {
  const _$TokenVerifyRequestCWProxyImpl(this._value);

  final TokenVerifyRequest _value;

  @override
  TokenVerifyRequest token(String token) => this(token: token);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TokenVerifyRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TokenVerifyRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  TokenVerifyRequest call({
    Object? token = const $CopyWithPlaceholder(),
  }) {
    return TokenVerifyRequest(
      token: token == const $CopyWithPlaceholder() || token == null
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String,
    );
  }
}

extension $TokenVerifyRequestCopyWith on TokenVerifyRequest {
  /// Returns a callable class that can be used as follows: `instanceOfTokenVerifyRequest.copyWith(...)` or like so:`instanceOfTokenVerifyRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TokenVerifyRequestCWProxy get copyWith =>
      _$TokenVerifyRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenVerifyRequest _$TokenVerifyRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TokenVerifyRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['token'],
        );
        final val = TokenVerifyRequest(
          token: $checkedConvert('token', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$TokenVerifyRequestToJson(TokenVerifyRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
