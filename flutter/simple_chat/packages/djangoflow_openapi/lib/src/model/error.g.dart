// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ErrorCWProxy {
  Error message(String message);

  Error code(String code);

  Error field(String? field);

  Error extraData(Map<String, Object>? extraData);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Error(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Error(...).copyWith(id: 12, name: "My name")
  /// ````
  Error call({
    String? message,
    String? code,
    String? field,
    Map<String, Object>? extraData,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfError.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfError.copyWith.fieldName(...)`
class _$ErrorCWProxyImpl implements _$ErrorCWProxy {
  const _$ErrorCWProxyImpl(this._value);

  final Error _value;

  @override
  Error message(String message) => this(message: message);

  @override
  Error code(String code) => this(code: code);

  @override
  Error field(String? field) => this(field: field);

  @override
  Error extraData(Map<String, Object>? extraData) => this(extraData: extraData);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Error(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Error(...).copyWith(id: 12, name: "My name")
  /// ````
  Error call({
    Object? message = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? field = const $CopyWithPlaceholder(),
    Object? extraData = const $CopyWithPlaceholder(),
  }) {
    return Error(
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String,
      field: field == const $CopyWithPlaceholder()
          ? _value.field
          // ignore: cast_nullable_to_non_nullable
          : field as String?,
      extraData: extraData == const $CopyWithPlaceholder()
          ? _value.extraData
          // ignore: cast_nullable_to_non_nullable
          : extraData as Map<String, Object>?,
    );
  }
}

extension $ErrorCopyWith on Error {
  /// Returns a callable class that can be used as follows: `instanceOfError.copyWith(...)` or like so:`instanceOfError.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ErrorCWProxy get copyWith => _$ErrorCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Error',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message', 'code'],
        );
        final val = Error(
          message: $checkedConvert('message', (v) => v as String),
          code: $checkedConvert('code', (v) => v as String),
          field: $checkedConvert('field', (v) => v as String?),
          extraData: $checkedConvert(
              'extra_data',
              (v) => (v as Map<String, dynamic>?)?.map(
                    (k, e) => MapEntry(k, e as Object),
                  )),
        );
        return val;
      },
      fieldKeyMap: const {'extraData': 'extra_data'},
    );

Map<String, dynamic> _$ErrorToJson(Error instance) {
  final val = <String, dynamic>{
    'message': instance.message,
    'code': instance.code,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('field', instance.field);
  writeNotNull('extra_data', instance.extraData);
  return val;
}
