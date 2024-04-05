// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatMessageRequestCWProxy {
  ChatMessageRequest message(String message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessageRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessageRequest call({
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatMessageRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatMessageRequest.copyWith.fieldName(...)`
class _$ChatMessageRequestCWProxyImpl implements _$ChatMessageRequestCWProxy {
  const _$ChatMessageRequestCWProxyImpl(this._value);

  final ChatMessageRequest _value;

  @override
  ChatMessageRequest message(String message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatMessageRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatMessageRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatMessageRequest call({
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return ChatMessageRequest(
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $ChatMessageRequestCopyWith on ChatMessageRequest {
  /// Returns a callable class that can be used as follows: `instanceOfChatMessageRequest.copyWith(...)` or like so:`instanceOfChatMessageRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatMessageRequestCWProxy get copyWith =>
      _$ChatMessageRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageRequest _$ChatMessageRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ChatMessageRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['message'],
        );
        final val = ChatMessageRequest(
          message: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$ChatMessageRequestToJson(ChatMessageRequest instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
