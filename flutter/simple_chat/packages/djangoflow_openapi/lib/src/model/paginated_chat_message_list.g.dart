// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_chat_message_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PaginatedChatMessageListCWProxy {
  PaginatedChatMessageList count(int? count);

  PaginatedChatMessageList next(String? next);

  PaginatedChatMessageList previous(String? previous);

  PaginatedChatMessageList results(List<ChatMessage>? results);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaginatedChatMessageList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaginatedChatMessageList(...).copyWith(id: 12, name: "My name")
  /// ````
  PaginatedChatMessageList call({
    int? count,
    String? next,
    String? previous,
    List<ChatMessage>? results,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPaginatedChatMessageList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPaginatedChatMessageList.copyWith.fieldName(...)`
class _$PaginatedChatMessageListCWProxyImpl
    implements _$PaginatedChatMessageListCWProxy {
  const _$PaginatedChatMessageListCWProxyImpl(this._value);

  final PaginatedChatMessageList _value;

  @override
  PaginatedChatMessageList count(int? count) => this(count: count);

  @override
  PaginatedChatMessageList next(String? next) => this(next: next);

  @override
  PaginatedChatMessageList previous(String? previous) =>
      this(previous: previous);

  @override
  PaginatedChatMessageList results(List<ChatMessage>? results) =>
      this(results: results);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PaginatedChatMessageList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PaginatedChatMessageList(...).copyWith(id: 12, name: "My name")
  /// ````
  PaginatedChatMessageList call({
    Object? count = const $CopyWithPlaceholder(),
    Object? next = const $CopyWithPlaceholder(),
    Object? previous = const $CopyWithPlaceholder(),
    Object? results = const $CopyWithPlaceholder(),
  }) {
    return PaginatedChatMessageList(
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      next: next == const $CopyWithPlaceholder()
          ? _value.next
          // ignore: cast_nullable_to_non_nullable
          : next as String?,
      previous: previous == const $CopyWithPlaceholder()
          ? _value.previous
          // ignore: cast_nullable_to_non_nullable
          : previous as String?,
      results: results == const $CopyWithPlaceholder()
          ? _value.results
          // ignore: cast_nullable_to_non_nullable
          : results as List<ChatMessage>?,
    );
  }
}

extension $PaginatedChatMessageListCopyWith on PaginatedChatMessageList {
  /// Returns a callable class that can be used as follows: `instanceOfPaginatedChatMessageList.copyWith(...)` or like so:`instanceOfPaginatedChatMessageList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PaginatedChatMessageListCWProxy get copyWith =>
      _$PaginatedChatMessageListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedChatMessageList _$PaginatedChatMessageListFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PaginatedChatMessageList',
      json,
      ($checkedConvert) {
        final val = PaginatedChatMessageList(
          count: $checkedConvert('count', (v) => v as int?),
          next: $checkedConvert('next', (v) => v as String?),
          previous: $checkedConvert('previous', (v) => v as String?),
          results: $checkedConvert(
              'results',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$PaginatedChatMessageListToJson(
    PaginatedChatMessageList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  writeNotNull('results', instance.results?.map((e) => e.toJson()).toList());
  return val;
}
