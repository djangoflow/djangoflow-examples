// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_chat_message_update_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PatchedChatMessageUpdateRequestCWProxy {
  PatchedChatMessageUpdateRequest message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PatchedChatMessageUpdateRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PatchedChatMessageUpdateRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PatchedChatMessageUpdateRequest call({
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPatchedChatMessageUpdateRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPatchedChatMessageUpdateRequest.copyWith.fieldName(...)`
class _$PatchedChatMessageUpdateRequestCWProxyImpl
    implements _$PatchedChatMessageUpdateRequestCWProxy {
  const _$PatchedChatMessageUpdateRequestCWProxyImpl(this._value);

  final PatchedChatMessageUpdateRequest _value;

  @override
  PatchedChatMessageUpdateRequest message(String? message) =>
      this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PatchedChatMessageUpdateRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PatchedChatMessageUpdateRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PatchedChatMessageUpdateRequest call({
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return PatchedChatMessageUpdateRequest(
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $PatchedChatMessageUpdateRequestCopyWith
    on PatchedChatMessageUpdateRequest {
  /// Returns a callable class that can be used as follows: `instanceOfPatchedChatMessageUpdateRequest.copyWith(...)` or like so:`instanceOfPatchedChatMessageUpdateRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PatchedChatMessageUpdateRequestCWProxy get copyWith =>
      _$PatchedChatMessageUpdateRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchedChatMessageUpdateRequest _$PatchedChatMessageUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PatchedChatMessageUpdateRequest',
      json,
      ($checkedConvert) {
        final val = PatchedChatMessageUpdateRequest(
          message: $checkedConvert('message', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$PatchedChatMessageUpdateRequestToJson(
    PatchedChatMessageUpdateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  return val;
}
