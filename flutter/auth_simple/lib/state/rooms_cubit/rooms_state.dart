import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rooms_state.freezed.dart';

part 'rooms_state.g.dart';

@freezed
class RoomsState with _$RoomsState {
  const factory RoomsState({
    required PaginationRoomsEntity data,
    @Default(false) bool hasNextPage,
    @Default(false) bool loading,
    @Default(false) bool paginationLoading,
  }) = _RoomsState;

  factory RoomsState.fromJson(Map<String, dynamic> json) =>
      _$RoomsStateFromJson(json);
}
