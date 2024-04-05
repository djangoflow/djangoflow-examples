// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_chat_room_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaginatedChatRoomListCWProxy {
  PaginatedChatRoomList count(int count);

  PaginatedChatRoomList next(String? next);

  PaginatedChatRoomList previous(String? previous);

  PaginatedChatRoomList results(List<ChatRoom> results);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaginatedChatRoomList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaginatedChatRoomList(...).copyWith(id: 12, name: "My name")
  /// ````
  PaginatedChatRoomList call({
    int? count,
    String? next,
    String? previous,
    List<ChatRoom>? results,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaginatedChatRoomList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaginatedChatRoomList.copyWith.fieldName(...)`
class _$PaginatedChatRoomListCWProxyImpl
    implements _$PaginatedChatRoomListCWProxy {
  const _$PaginatedChatRoomListCWProxyImpl(this._value);

  final PaginatedChatRoomList _value;

  @override
  PaginatedChatRoomList count(int count) => this(count: count);

  @override
  PaginatedChatRoomList next(String? next) => this(next: next);

  @override
  PaginatedChatRoomList previous(String? previous) => this(previous: previous);

  @override
  PaginatedChatRoomList results(List<ChatRoom> results) =>
      this(results: results);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaginatedChatRoomList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaginatedChatRoomList(...).copyWith(id: 12, name: "My name")
  /// ````
  PaginatedChatRoomList call({
    Object? count = const $CopyWithPlaceholder(),
    Object? next = const $CopyWithPlaceholder(),
    Object? previous = const $CopyWithPlaceholder(),
    Object? results = const $CopyWithPlaceholder(),
  }) {
    return PaginatedChatRoomList(
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
          : results as List<ChatRoom>,
    );
  }
}

extension $PaginatedChatRoomListCopyWith on PaginatedChatRoomList {
  /// Returns a callable class that can be used as follows: `instanceOfPaginatedChatRoomList.copyWith(...)` or like so:`instanceOfPaginatedChatRoomList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaginatedChatRoomListCWProxy get copyWith =>
      _$PaginatedChatRoomListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedChatRoomList _$PaginatedChatRoomListFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PaginatedChatRoomList',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['count', 'results'],
        );
        final val = PaginatedChatRoomList(
          count: $checkedConvert('count', (v) => v as int),
          next: $checkedConvert('next', (v) => v as String?),
          previous: $checkedConvert('previous', (v) => v as String?),
          results: $checkedConvert(
              'results',
              (v) => (v as List<dynamic>)
                  .map((e) => ChatRoom.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$PaginatedChatRoomListToJson(
    PaginatedChatRoomList instance) {
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
