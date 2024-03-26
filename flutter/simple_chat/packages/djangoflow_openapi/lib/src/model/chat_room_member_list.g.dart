// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_member_list.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChatRoomMemberListCWProxy {
  ChatRoomMemberList members(List<User>? members);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomMemberList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomMemberList(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomMemberList call({
    List<User>? members,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChatRoomMemberList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChatRoomMemberList.copyWith.fieldName(...)`
class _$ChatRoomMemberListCWProxyImpl implements _$ChatRoomMemberListCWProxy {
  const _$ChatRoomMemberListCWProxyImpl(this._value);

  final ChatRoomMemberList _value;

  @override
  ChatRoomMemberList members(List<User>? members) => this(members: members);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChatRoomMemberList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChatRoomMemberList(...).copyWith(id: 12, name: "My name")
  /// ````
  ChatRoomMemberList call({
    Object? members = const $CopyWithPlaceholder(),
  }) {
    return ChatRoomMemberList(
      members: members == const $CopyWithPlaceholder()
          ? _value.members
          // ignore: cast_nullable_to_non_nullable
          : members as List<User>?,
    );
  }
}

extension $ChatRoomMemberListCopyWith on ChatRoomMemberList {
  /// Returns a callable class that can be used as follows: `instanceOfChatRoomMemberList.copyWith(...)` or like so:`instanceOfChatRoomMemberList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChatRoomMemberListCWProxy get copyWith =>
      _$ChatRoomMemberListCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRoomMemberList _$ChatRoomMemberListFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ChatRoomMemberList',
      json,
      ($checkedConvert) {
        final val = ChatRoomMemberList(
          members: $checkedConvert(
              'members',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => User.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$ChatRoomMemberListToJson(ChatRoomMemberList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('members', instance.members?.map((e) => e.toJson()).toList());
  return val;
}
