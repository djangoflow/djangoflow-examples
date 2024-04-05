// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patched_chat_message_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PatchedChatMessageRequestCWProxy {
  PatchedChatMessageRequest message(String? message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PatchedChatMessageRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PatchedChatMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PatchedChatMessageRequest call({
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPatchedChatMessageRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPatchedChatMessageRequest.copyWith.fieldName(...)`
class _$PatchedChatMessageRequestCWProxyImpl
    implements _$PatchedChatMessageRequestCWProxy {
  const _$PatchedChatMessageRequestCWProxyImpl(this._value);

  final PatchedChatMessageRequest _value;

  @override
  PatchedChatMessageRequest message(String? message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PatchedChatMessageRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PatchedChatMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  PatchedChatMessageRequest call({
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return PatchedChatMessageRequest(
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
    );
  }
}

extension $PatchedChatMessageRequestCopyWith on PatchedChatMessageRequest {
  /// Returns a callable class that can be used as follows: `instanceOfPatchedChatMessageRequest.copyWith(...)` or like so:`instanceOfPatchedChatMessageRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PatchedChatMessageRequestCWProxy get copyWith =>
      _$PatchedChatMessageRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatchedChatMessageRequest _$PatchedChatMessageRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'PatchedChatMessageRequest',
      json,
      ($checkedConvert) {
        final val = PatchedChatMessageRequest(
          message: $checkedConvert('message', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$PatchedChatMessageRequestToJson(
    PatchedChatMessageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  return val;
}
