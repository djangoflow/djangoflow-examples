// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_members_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatRoomMembersRequestCWProxy {
  ChatRoomMembersRequest users(List<int> users);

  ChatRoomMembersRequest action(ActionEnum action);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomMembersRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomMembersRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomMembersRequest call({
    List<int>? users,
    ActionEnum? action,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatRoomMembersRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatRoomMembersRequest.copyWith.fieldName(...)`
class _$ChatRoomMembersRequestCWProxyImpl
    implements _$ChatRoomMembersRequestCWProxy {
  const _$ChatRoomMembersRequestCWProxyImpl(this._value);

  final ChatRoomMembersRequest _value;

  @override
  ChatRoomMembersRequest users(List<int> users) => this(users: users);

  @override
  ChatRoomMembersRequest action(ActionEnum action) => this(action: action);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomMembersRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomMembersRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomMembersRequest call({
    Object? users = const $CopyWithPlaceholder(),
    Object? action = const $CopyWithPlaceholder(),
  }) {
    return ChatRoomMembersRequest(
      users: users == const $CopyWithPlaceholder() || users == null
          ? _value.users
          // ignore: cast_nullable_to_non_nullable
          : users as List<int>,
      action: action == const $CopyWithPlaceholder() || action == null
          ? _value.action
          // ignore: cast_nullable_to_non_nullable
          : action as ActionEnum,
    );
  }
}

extension $ChatRoomMembersRequestCopyWith on ChatRoomMembersRequest {
  /// Returns a callable class that can be used as follows: `instanceOfChatRoomMembersRequest.copyWith(...)` or like so:`instanceOfChatRoomMembersRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatRoomMembersRequestCWProxy get copyWith =>
      _$ChatRoomMembersRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomMembersRequest _$ChatRoomMembersRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ChatRoomMembersRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['users', 'action'],
        );
        final val = ChatRoomMembersRequest(
          users: $checkedConvert('users',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          action: $checkedConvert(
              'action', (v) => $enumDecode(_$ActionEnumEnumMap, v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ChatRoomMembersRequestToJson(
        ChatRoomMembersRequest instance) =>
    <String, dynamic>{
      'users': instance.users,
      'action': _$ActionEnumEnumMap[instance.action]!,
    };

const _$ActionEnumEnumMap = {
  ActionEnum.add: 'add',
  ActionEnum.remove: 'remove',
};
