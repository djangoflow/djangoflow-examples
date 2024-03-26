// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_update_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatMessageUpdateRequestCWProxy {
  ChatMessageUpdateRequest message(String message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessageUpdateRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessageUpdateRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessageUpdateRequest call({
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatMessageUpdateRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatMessageUpdateRequest.copyWith.fieldName(...)`
class _$ChatMessageUpdateRequestCWProxyImpl
    implements _$ChatMessageUpdateRequestCWProxy {
  const _$ChatMessageUpdateRequestCWProxyImpl(this._value);

  final ChatMessageUpdateRequest _value;

  @override
  ChatMessageUpdateRequest message(String message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessageUpdateRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessageUpdateRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessageUpdateRequest call({
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return ChatMessageUpdateRequest(
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $ChatMessageUpdateRequestCopyWith on ChatMessageUpdateRequest {
  /// Returns a callable class that can be used as follows: `instanceOfChatMessageUpdateRequest.copyWith(...)` or like so:`instanceOfChatMessageUpdateRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatMessageUpdateRequestCWProxy get copyWith =>
      _$ChatMessageUpdateRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageUpdateRequest _$ChatMessageUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ChatMessageUpdateRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message'],
        );
        final val = ChatMessageUpdateRequest(
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ChatMessageUpdateRequestToJson(
        ChatMessageUpdateRequest instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
