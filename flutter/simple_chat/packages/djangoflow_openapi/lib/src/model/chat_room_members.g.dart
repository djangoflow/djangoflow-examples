// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_members.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatRoomMembersCWProxy {
  ChatRoomMembers users(List<int> users);

  ChatRoomMembers action(ActionEnum action);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomMembers(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomMembers(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomMembers call({
    List<int>? users,
    ActionEnum? action,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatRoomMembers.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatRoomMembers.copyWith.fieldName(...)`
class _$ChatRoomMembersCWProxyImpl implements _$ChatRoomMembersCWProxy {
  const _$ChatRoomMembersCWProxyImpl(this._value);

  final ChatRoomMembers _value;

  @override
  ChatRoomMembers users(List<int> users) => this(users: users);

  @override
  ChatRoomMembers action(ActionEnum action) => this(action: action);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomMembers(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomMembers(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomMembers call({
    Object? users = const $CopyWithPlaceholder(),
    Object? action = const $CopyWithPlaceholder(),
  }) {
    return ChatRoomMembers(
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

extension $ChatRoomMembersCopyWith on ChatRoomMembers {
  /// Returns a callable class that can be used as follows: `instanceOfChatRoomMembers.copyWith(...)` or like so:`instanceOfChatRoomMembers.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatRoomMembersCWProxy get copyWith => _$ChatRoomMembersCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomMembers _$ChatRoomMembersFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ChatRoomMembers',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['users', 'action'],
        );
        final val = ChatRoomMembers(
          users: $checkedConvert('users',
              (v) => (v as List<dynamic>).map((e) => e as int).toList()),
          action: $checkedConvert(
              'action', (v) => $enumDecode(_$ActionEnumEnumMap, v)),
        );
        return val;
      },
    );

Map<String, dynamic> _$ChatRoomMembersToJson(ChatRoomMembers instance) =>
    <String, dynamic>{
      'users': instance.users,
      'action': _$ActionEnumEnumMap[instance.action]!,
    };

const _$ActionEnumEnumMap = {
  ActionEnum.add: 'add',
  ActionEnum.remove: 'remove',
};
