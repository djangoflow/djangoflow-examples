// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ErrorResponseCWProxy {
  ErrorResponse errors(List<Error> errors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorResponse call({
    List<Error>? errors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfErrorResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfErrorResponse.copyWith.fieldName(...)`
class _$ErrorResponseCWProxyImpl implements _$ErrorResponseCWProxy {
  const _$ErrorResponseCWProxyImpl(this._value);

  final ErrorResponse _value;

  @override
  ErrorResponse errors(List<Error> errors) => this(errors: errors);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ErrorResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ErrorResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  ErrorResponse call({
    Object? errors = const $CopyWithPlaceholder(),
  }) {
    return ErrorResponse(
      errors: errors == const $CopyWithPlaceholder() || errors == null
          ? _value.errors
          // ignore: cast_nullable_to_non_nullable
          : errors as List<Error>,
    );
  }
}

extension $ErrorResponseCopyWith on ErrorResponse {
  /// Returns a callable class that can be used as follows: `instanceOfErrorResponse.copyWith(...)` or like so:`instanceOfErrorResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ErrorResponseCWProxy get copyWith => _$ErrorResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ErrorResponse',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['errors'],
        );
        final val = ErrorResponse(
          errors: $checkedConvert(
              'errors',
              (v) => (v as List<dynamic>)
                  .map((e) => Error.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'errors': instance.errors.map((e) => e.toJson()).toList(),
    };
