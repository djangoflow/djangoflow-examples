// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TokenCWProxy {
  Token token(String? token);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Token(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Token(...).copyWith(id: 12, name: "My name")
  /// ````
  Token call({
    String? token,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfToken.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfToken.copyWith.fieldName(...)`
class _$TokenCWProxyImpl implements _$TokenCWProxy {
  const _$TokenCWProxyImpl(this._value);

  final Token _value;

  @override
  Token token(String? token) => this(token: token);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Token(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Token(...).copyWith(id: 12, name: "My name")
  /// ````
  Token call({
    Object? token = const $CopyWithPlaceholder(),
  }) {
    return Token(
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String?,
    );
  }
}

extension $TokenCopyWith on Token {
  /// Returns a callable class that can be used as follows: `instanceOfToken.copyWith(...)` or like so:`instanceOfToken.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TokenCWProxy get copyWith => _$TokenCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Token',
      json,
      ($checkedConvert) {
        final val = Token(
          token: $checkedConvert('token', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$TokenToJson(Token instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('token', instance.token);
  return val;
}
