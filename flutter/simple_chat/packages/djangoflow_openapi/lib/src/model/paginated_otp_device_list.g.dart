// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_otp_device_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaginatedOTPDeviceListCWProxy {
  PaginatedOTPDeviceList count(int count);

  PaginatedOTPDeviceList next(String? next);

  PaginatedOTPDeviceList previous(String? previous);

  PaginatedOTPDeviceList results(List<OTPDevice> results);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaginatedOTPDeviceList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaginatedOTPDeviceList(...).copyWith(id: 12, name: "My name")
  /// ````
  PaginatedOTPDeviceList call({
    int? count,
    String? next,
    String? previous,
    List<OTPDevice>? results,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaginatedOTPDeviceList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaginatedOTPDeviceList.copyWith.fieldName(...)`
class _$PaginatedOTPDeviceListCWProxyImpl
    implements _$PaginatedOTPDeviceListCWProxy {
  const _$PaginatedOTPDeviceListCWProxyImpl(this._value);

  final PaginatedOTPDeviceList _value;

  @override
  PaginatedOTPDeviceList count(int count) => this(count: count);

  @override
  PaginatedOTPDeviceList next(String? next) => this(next: next);

  @override
  PaginatedOTPDeviceList previous(String? previous) => this(previous: previous);

  @override
  PaginatedOTPDeviceList results(List<OTPDevice> results) =>
      this(results: results);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaginatedOTPDeviceList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaginatedOTPDeviceList(...).copyWith(id: 12, name: "My name")
  /// ````
  PaginatedOTPDeviceList call({
    Object? count = const $CopyWithPlaceholder(),
    Object? next = const $CopyWithPlaceholder(),
    Object? previous = const $CopyWithPlaceholder(),
    Object? results = const $CopyWithPlaceholder(),
  }) {
    return PaginatedOTPDeviceList(
      count: count == const $CopyWithPlaceholder() || count == null
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int,
      next: next == const $CopyWithPlaceholder()
          ? _value.next
          // ignore: cast_nullable_to_non_nullable
          : next as String?,
      previous: previous == const $CopyWithPlaceholder()
          ? _value.previous
          // ignore: cast_nullable_to_non_nullable
          : previous as String?,
      results: results == const $CopyWithPlaceholder() || results == null
          ? _value.results
          // ignore: cast_nullable_to_non_nullable
          : results as List<OTPDevice>,
    );
  }
}

extension $PaginatedOTPDeviceListCopyWith on PaginatedOTPDeviceList {
  /// Returns a callable class that can be used as follows: `instanceOfPaginatedOTPDeviceList.copyWith(...)` or like so:`instanceOfPaginatedOTPDeviceList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaginatedOTPDeviceListCWProxy get copyWith =>
      _$PaginatedOTPDeviceListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedOTPDeviceList _$PaginatedOTPDeviceListFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PaginatedOTPDeviceList',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['count', 'results'],
        );
        final val = PaginatedOTPDeviceList(
          count: $checkedConvert('count', (v) => v as int),
          next: $checkedConvert('next', (v) => v as String?),
          previous: $checkedConvert('previous', (v) => v as String?),
          results: $checkedConvert(
              'results',
              (v) => (v as List<dynamic>)
                  .map((e) => OTPDevice.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$PaginatedOTPDeviceListToJson(
    PaginatedOTPDeviceList instance) {
  final val = <String, dynamic>{
    'count': instance.count,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  val['results'] = instance.results.map((e) => e.toJson()).toList();
  return val;
}
