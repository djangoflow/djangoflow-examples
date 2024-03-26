// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatRoomsListFilter _$ChatRoomsListFilterFromJson(Map<String, dynamic> json) {
  return _ChatRoomsListFilter.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomsListFilter {
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomsListFilterCopyWith<ChatRoomsListFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomsListFilterCopyWith<$Res> {
  factory $ChatRoomsListFilterCopyWith(
          ChatRoomsListFilter value, $Res Function(ChatRoomsListFilter) then) =
      _$ChatRoomsListFilterCopyWithImpl<$Res, ChatRoomsListFilter>;
  @useResult
  $Res call({int limit, int offset});
}

/// @nodoc
class _$ChatRoomsListFilterCopyWithImpl<$Res, $Val extends ChatRoomsListFilter>
    implements $ChatRoomsListFilterCopyWith<$Res> {
  _$ChatRoomsListFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomsListFilterImplCopyWith<$Res>
    implements $ChatRoomsListFilterCopyWith<$Res> {
  factory _$$ChatRoomsListFilterImplCopyWith(_$ChatRoomsListFilterImpl value,
          $Res Function(_$ChatRoomsListFilterImpl) then) =
      __$$ChatRoomsListFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int offset});
}

/// @nodoc
class __$$ChatRoomsListFilterImplCopyWithImpl<$Res>
    extends _$ChatRoomsListFilterCopyWithImpl<$Res, _$ChatRoomsListFilterImpl>
    implements _$$ChatRoomsListFilterImplCopyWith<$Res> {
  __$$ChatRoomsListFilterImplCopyWithImpl(_$ChatRoomsListFilterImpl _value,
      $Res Function(_$ChatRoomsListFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_$ChatRoomsListFilterImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomsListFilterImpl extends _ChatRoomsListFilter
    with DiagnosticableTreeMixin {
  const _$ChatRoomsListFilterImpl({this.limit = 25, this.offset = 0})
      : super._();

  factory _$ChatRoomsListFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomsListFilterImplFromJson(json);

  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int offset;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatRoomsListFilter(limit: $limit, offset: $offset)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatRoomsListFilter'))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('offset', offset));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomsListFilterImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomsListFilterImplCopyWith<_$ChatRoomsListFilterImpl> get copyWith =>
      __$$ChatRoomsListFilterImplCopyWithImpl<_$ChatRoomsListFilterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomsListFilterImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomsListFilter extends ChatRoomsListFilter
    implements OffsetLimitFilter {
  const factory _ChatRoomsListFilter({final int limit, final int offset}) =
      _$ChatRoomsListFilterImpl;
  const _ChatRoomsListFilter._() : super._();

  factory _ChatRoomsListFilter.fromJson(Map<String, dynamic> json) =
      _$ChatRoomsListFilterImpl.fromJson;

  @override
  int get limit;
  @override
  int get offset;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomsListFilterImplCopyWith<_$ChatRoomsListFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatRoomsRetrieveFilter _$ChatRoomsRetrieveFilterFromJson(
    Map<String, dynamic> json) {
  return _ChatRoomsRetrieveFilter.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomsRetrieveFilter {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomsRetrieveFilterCopyWith<ChatRoomsRetrieveFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomsRetrieveFilterCopyWith<$Res> {
  factory $ChatRoomsRetrieveFilterCopyWith(ChatRoomsRetrieveFilter value,
          $Res Function(ChatRoomsRetrieveFilter) then) =
      _$ChatRoomsRetrieveFilterCopyWithImpl<$Res, ChatRoomsRetrieveFilter>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$ChatRoomsRetrieveFilterCopyWithImpl<$Res,
        $Val extends ChatRoomsRetrieveFilter>
    implements $ChatRoomsRetrieveFilterCopyWith<$Res> {
  _$ChatRoomsRetrieveFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomsRetrieveFilterImplCopyWith<$Res>
    implements $ChatRoomsRetrieveFilterCopyWith<$Res> {
  factory _$$ChatRoomsRetrieveFilterImplCopyWith(
          _$ChatRoomsRetrieveFilterImpl value,
          $Res Function(_$ChatRoomsRetrieveFilterImpl) then) =
      __$$ChatRoomsRetrieveFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ChatRoomsRetrieveFilterImplCopyWithImpl<$Res>
    extends _$ChatRoomsRetrieveFilterCopyWithImpl<$Res,
        _$ChatRoomsRetrieveFilterImpl>
    implements _$$ChatRoomsRetrieveFilterImplCopyWith<$Res> {
  __$$ChatRoomsRetrieveFilterImplCopyWithImpl(
      _$ChatRoomsRetrieveFilterImpl _value,
      $Res Function(_$ChatRoomsRetrieveFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ChatRoomsRetrieveFilterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomsRetrieveFilterImpl extends _ChatRoomsRetrieveFilter
    with DiagnosticableTreeMixin {
  const _$ChatRoomsRetrieveFilterImpl({required this.id}) : super._();

  factory _$ChatRoomsRetrieveFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRoomsRetrieveFilterImplFromJson(json);

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatRoomsRetrieveFilter(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatRoomsRetrieveFilter'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomsRetrieveFilterImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomsRetrieveFilterImplCopyWith<_$ChatRoomsRetrieveFilterImpl>
      get copyWith => __$$ChatRoomsRetrieveFilterImplCopyWithImpl<
          _$ChatRoomsRetrieveFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomsRetrieveFilterImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomsRetrieveFilter extends ChatRoomsRetrieveFilter {
  const factory _ChatRoomsRetrieveFilter({required final String id}) =
      _$ChatRoomsRetrieveFilterImpl;
  const _ChatRoomsRetrieveFilter._() : super._();

  factory _ChatRoomsRetrieveFilter.fromJson(Map<String, dynamic> json) =
      _$ChatRoomsRetrieveFilterImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomsRetrieveFilterImplCopyWith<_$ChatRoomsRetrieveFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatRoomsMembersRetrieveFilter _$ChatRoomsMembersRetrieveFilterFromJson(
    Map<String, dynamic> json) {
  return _ChatRoomsMembersRetrieveFilter.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomsMembersRetrieveFilter {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomsMembersRetrieveFilterCopyWith<ChatRoomsMembersRetrieveFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomsMembersRetrieveFilterCopyWith<$Res> {
  factory $ChatRoomsMembersRetrieveFilterCopyWith(
          ChatRoomsMembersRetrieveFilter value,
          $Res Function(ChatRoomsMembersRetrieveFilter) then) =
      _$ChatRoomsMembersRetrieveFilterCopyWithImpl<$Res,
          ChatRoomsMembersRetrieveFilter>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$ChatRoomsMembersRetrieveFilterCopyWithImpl<$Res,
        $Val extends ChatRoomsMembersRetrieveFilter>
    implements $ChatRoomsMembersRetrieveFilterCopyWith<$Res> {
  _$ChatRoomsMembersRetrieveFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomsMembersRetrieveFilterImplCopyWith<$Res>
    implements $ChatRoomsMembersRetrieveFilterCopyWith<$Res> {
  factory _$$ChatRoomsMembersRetrieveFilterImplCopyWith(
          _$ChatRoomsMembersRetrieveFilterImpl value,
          $Res Function(_$ChatRoomsMembersRetrieveFilterImpl) then) =
      __$$ChatRoomsMembersRetrieveFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ChatRoomsMembersRetrieveFilterImplCopyWithImpl<$Res>
    extends _$ChatRoomsMembersRetrieveFilterCopyWithImpl<$Res,
        _$ChatRoomsMembersRetrieveFilterImpl>
    implements _$$ChatRoomsMembersRetrieveFilterImplCopyWith<$Res> {
  __$$ChatRoomsMembersRetrieveFilterImplCopyWithImpl(
      _$ChatRoomsMembersRetrieveFilterImpl _value,
      $Res Function(_$ChatRoomsMembersRetrieveFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ChatRoomsMembersRetrieveFilterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomsMembersRetrieveFilterImpl
    extends _ChatRoomsMembersRetrieveFilter with DiagnosticableTreeMixin {
  const _$ChatRoomsMembersRetrieveFilterImpl({required this.id}) : super._();

  factory _$ChatRoomsMembersRetrieveFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChatRoomsMembersRetrieveFilterImplFromJson(json);

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatRoomsMembersRetrieveFilter(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatRoomsMembersRetrieveFilter'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomsMembersRetrieveFilterImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomsMembersRetrieveFilterImplCopyWith<
          _$ChatRoomsMembersRetrieveFilterImpl>
      get copyWith => __$$ChatRoomsMembersRetrieveFilterImplCopyWithImpl<
          _$ChatRoomsMembersRetrieveFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomsMembersRetrieveFilterImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomsMembersRetrieveFilter
    extends ChatRoomsMembersRetrieveFilter {
  const factory _ChatRoomsMembersRetrieveFilter({required final String id}) =
      _$ChatRoomsMembersRetrieveFilterImpl;
  const _ChatRoomsMembersRetrieveFilter._() : super._();

  factory _ChatRoomsMembersRetrieveFilter.fromJson(Map<String, dynamic> json) =
      _$ChatRoomsMembersRetrieveFilterImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomsMembersRetrieveFilterImplCopyWith<
          _$ChatRoomsMembersRetrieveFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatRoomsMessagesListFilter _$ChatRoomsMessagesListFilterFromJson(
    Map<String, dynamic> json) {
  return _ChatRoomsMessagesListFilter.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomsMessagesListFilter {
  String get roomId => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomsMessagesListFilterCopyWith<ChatRoomsMessagesListFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomsMessagesListFilterCopyWith<$Res> {
  factory $ChatRoomsMessagesListFilterCopyWith(
          ChatRoomsMessagesListFilter value,
          $Res Function(ChatRoomsMessagesListFilter) then) =
      _$ChatRoomsMessagesListFilterCopyWithImpl<$Res,
          ChatRoomsMessagesListFilter>;
  @useResult
  $Res call({String roomId, int limit, int offset});
}

/// @nodoc
class _$ChatRoomsMessagesListFilterCopyWithImpl<$Res,
        $Val extends ChatRoomsMessagesListFilter>
    implements $ChatRoomsMessagesListFilterCopyWith<$Res> {
  _$ChatRoomsMessagesListFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomsMessagesListFilterImplCopyWith<$Res>
    implements $ChatRoomsMessagesListFilterCopyWith<$Res> {
  factory _$$ChatRoomsMessagesListFilterImplCopyWith(
          _$ChatRoomsMessagesListFilterImpl value,
          $Res Function(_$ChatRoomsMessagesListFilterImpl) then) =
      __$$ChatRoomsMessagesListFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomId, int limit, int offset});
}

/// @nodoc
class __$$ChatRoomsMessagesListFilterImplCopyWithImpl<$Res>
    extends _$ChatRoomsMessagesListFilterCopyWithImpl<$Res,
        _$ChatRoomsMessagesListFilterImpl>
    implements _$$ChatRoomsMessagesListFilterImplCopyWith<$Res> {
  __$$ChatRoomsMessagesListFilterImplCopyWithImpl(
      _$ChatRoomsMessagesListFilterImpl _value,
      $Res Function(_$ChatRoomsMessagesListFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_$ChatRoomsMessagesListFilterImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomsMessagesListFilterImpl extends _ChatRoomsMessagesListFilter
    with DiagnosticableTreeMixin {
  const _$ChatRoomsMessagesListFilterImpl(
      {required this.roomId, this.limit = 25, this.offset = 0})
      : super._();

  factory _$ChatRoomsMessagesListFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChatRoomsMessagesListFilterImplFromJson(json);

  @override
  final String roomId;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int offset;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatRoomsMessagesListFilter(roomId: $roomId, limit: $limit, offset: $offset)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatRoomsMessagesListFilter'))
      ..add(DiagnosticsProperty('roomId', roomId))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('offset', offset));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomsMessagesListFilterImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomsMessagesListFilterImplCopyWith<_$ChatRoomsMessagesListFilterImpl>
      get copyWith => __$$ChatRoomsMessagesListFilterImplCopyWithImpl<
          _$ChatRoomsMessagesListFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomsMessagesListFilterImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomsMessagesListFilter extends ChatRoomsMessagesListFilter
    implements OffsetLimitFilter {
  const factory _ChatRoomsMessagesListFilter(
      {required final String roomId,
      final int limit,
      final int offset}) = _$ChatRoomsMessagesListFilterImpl;
  const _ChatRoomsMessagesListFilter._() : super._();

  factory _ChatRoomsMessagesListFilter.fromJson(Map<String, dynamic> json) =
      _$ChatRoomsMessagesListFilterImpl.fromJson;

  @override
  String get roomId;
  @override
  int get limit;
  @override
  int get offset;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomsMessagesListFilterImplCopyWith<_$ChatRoomsMessagesListFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChatRoomsMessagesRetrieveFilter _$ChatRoomsMessagesRetrieveFilterFromJson(
    Map<String, dynamic> json) {
  return _ChatRoomsMessagesRetrieveFilter.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomsMessagesRetrieveFilter {
  int get id => throw _privateConstructorUsedError;
  String get roomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomsMessagesRetrieveFilterCopyWith<ChatRoomsMessagesRetrieveFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomsMessagesRetrieveFilterCopyWith<$Res> {
  factory $ChatRoomsMessagesRetrieveFilterCopyWith(
          ChatRoomsMessagesRetrieveFilter value,
          $Res Function(ChatRoomsMessagesRetrieveFilter) then) =
      _$ChatRoomsMessagesRetrieveFilterCopyWithImpl<$Res,
          ChatRoomsMessagesRetrieveFilter>;
  @useResult
  $Res call({int id, String roomId});
}

/// @nodoc
class _$ChatRoomsMessagesRetrieveFilterCopyWithImpl<$Res,
        $Val extends ChatRoomsMessagesRetrieveFilter>
    implements $ChatRoomsMessagesRetrieveFilterCopyWith<$Res> {
  _$ChatRoomsMessagesRetrieveFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomsMessagesRetrieveFilterImplCopyWith<$Res>
    implements $ChatRoomsMessagesRetrieveFilterCopyWith<$Res> {
  factory _$$ChatRoomsMessagesRetrieveFilterImplCopyWith(
          _$ChatRoomsMessagesRetrieveFilterImpl value,
          $Res Function(_$ChatRoomsMessagesRetrieveFilterImpl) then) =
      __$$ChatRoomsMessagesRetrieveFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String roomId});
}

/// @nodoc
class __$$ChatRoomsMessagesRetrieveFilterImplCopyWithImpl<$Res>
    extends _$ChatRoomsMessagesRetrieveFilterCopyWithImpl<$Res,
        _$ChatRoomsMessagesRetrieveFilterImpl>
    implements _$$ChatRoomsMessagesRetrieveFilterImplCopyWith<$Res> {
  __$$ChatRoomsMessagesRetrieveFilterImplCopyWithImpl(
      _$ChatRoomsMessagesRetrieveFilterImpl _value,
      $Res Function(_$ChatRoomsMessagesRetrieveFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = null,
  }) {
    return _then(_$ChatRoomsMessagesRetrieveFilterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRoomsMessagesRetrieveFilterImpl
    extends _ChatRoomsMessagesRetrieveFilter with DiagnosticableTreeMixin {
  const _$ChatRoomsMessagesRetrieveFilterImpl(
      {required this.id, required this.roomId})
      : super._();

  factory _$ChatRoomsMessagesRetrieveFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ChatRoomsMessagesRetrieveFilterImplFromJson(json);

  @override
  final int id;
  @override
  final String roomId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatRoomsMessagesRetrieveFilter(id: $id, roomId: $roomId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatRoomsMessagesRetrieveFilter'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('roomId', roomId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomsMessagesRetrieveFilterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomsMessagesRetrieveFilterImplCopyWith<
          _$ChatRoomsMessagesRetrieveFilterImpl>
      get copyWith => __$$ChatRoomsMessagesRetrieveFilterImplCopyWithImpl<
          _$ChatRoomsMessagesRetrieveFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRoomsMessagesRetrieveFilterImplToJson(
      this,
    );
  }
}

abstract class _ChatRoomsMessagesRetrieveFilter
    extends ChatRoomsMessagesRetrieveFilter {
  const factory _ChatRoomsMessagesRetrieveFilter(
      {required final int id,
      required final String roomId}) = _$ChatRoomsMessagesRetrieveFilterImpl;
  const _ChatRoomsMessagesRetrieveFilter._() : super._();

  factory _ChatRoomsMessagesRetrieveFilter.fromJson(Map<String, dynamic> json) =
      _$ChatRoomsMessagesRetrieveFilterImpl.fromJson;

  @override
  int get id;
  @override
  String get roomId;
  @override
  @JsonKey(ignore: true)
  _$$ChatRoomsMessagesRetrieveFilterImplCopyWith<
          _$ChatRoomsMessagesRetrieveFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
