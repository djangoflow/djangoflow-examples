// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRoomsListFilterImpl _$$ChatRoomsListFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatRoomsListFilterImpl(
      limit: json['limit'] as int? ?? 25,
      offset: json['offset'] as int? ?? 0,
    );

Map<String, dynamic> _$$ChatRoomsListFilterImplToJson(
        _$ChatRoomsListFilterImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };

_$ChatRoomsRetrieveFilterImpl _$$ChatRoomsRetrieveFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatRoomsRetrieveFilterImpl(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$ChatRoomsRetrieveFilterImplToJson(
        _$ChatRoomsRetrieveFilterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

_$ChatRoomsMembersRetrieveFilterImpl
    _$$ChatRoomsMembersRetrieveFilterImplFromJson(Map<String, dynamic> json) =>
        _$ChatRoomsMembersRetrieveFilterImpl(
          id: json['id'] as String,
        );

Map<String, dynamic> _$$ChatRoomsMembersRetrieveFilterImplToJson(
        _$ChatRoomsMembersRetrieveFilterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

_$ChatRoomsMessagesListFilterImpl _$$ChatRoomsMessagesListFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatRoomsMessagesListFilterImpl(
      roomId: json['roomId'] as int,
      limit: json['limit'] as int? ?? 25,
      offset: json['offset'] as int? ?? 0,
    );

Map<String, dynamic> _$$ChatRoomsMessagesListFilterImplToJson(
        _$ChatRoomsMessagesListFilterImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'limit': instance.limit,
      'offset': instance.offset,
    };

_$ChatRoomsMessagesRetrieveFilterImpl
    _$$ChatRoomsMessagesRetrieveFilterImplFromJson(Map<String, dynamic> json) =>
        _$ChatRoomsMessagesRetrieveFilterImpl(
          id: json['id'] as int,
          roomId: json['roomId'] as int,
        );

Map<String, dynamic> _$$ChatRoomsMessagesRetrieveFilterImplToJson(
        _$ChatRoomsMessagesRetrieveFilterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
    };

_$AuthOtpDevicesListFilterImpl _$$AuthOtpDevicesListFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthOtpDevicesListFilterImpl(
      limit: json['limit'] as int? ?? 25,
      offset: json['offset'] as int? ?? 0,
    );

Map<String, dynamic> _$$AuthOtpDevicesListFilterImplToJson(
        _$AuthOtpDevicesListFilterImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
    };

_$AuthOtpDevicesRetrieveFilterImpl _$$AuthOtpDevicesRetrieveFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthOtpDevicesRetrieveFilterImpl(
      id: json['id'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$AuthOtpDevicesRetrieveFilterImplToJson(
        _$AuthOtpDevicesRetrieveFilterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };

_$AuthUsersRetrieveFilterImpl _$$AuthUsersRetrieveFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthUsersRetrieveFilterImpl(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$AuthUsersRetrieveFilterImplToJson(
        _$AuthUsersRetrieveFilterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

_$AuthUsersTwoFaRetrieveFilterImpl _$$AuthUsersTwoFaRetrieveFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthUsersTwoFaRetrieveFilterImpl(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$AuthUsersTwoFaRetrieveFilterImplToJson(
        _$AuthUsersTwoFaRetrieveFilterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
