import 'package:djangoflow_openapi/djangoflow_openapi.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  /// The [ChatApi] instance
  final RoomsApi _roomsApi;

  /// The default page size for pagination
  final int defaultChatPageSize;

  RoomsCubit(
    this._roomsApi, {
    this.defaultChatPageSize = 20,
  }) : super(RoomsState(data: PaginationRoomsEntity(results: [])));

  Future<void> loadData() async {
    startLoading();
    await loadMoreRooms(reload: true);
    stopLoading();
  }

  Future<void> loadMoreRooms({
    bool reload = false,
  }) async {
    startPaginationLoading();
    final rooms = await _roomsApi.getRooms(
      limit: defaultChatPageSize,
      offset: reload ? 0 : state.data.results.length,
    );

    emit(
      state.copyWith(
        hasNextPage: rooms.next != null,
        loading: false,
        paginationLoading: false,
        data: rooms,
      ),
    );
  }

  /// Dispatches loading state, helpful for displaying loading indicator
  void startLoading() => emit(state.copyWith(loading: true));

  /// Dispatches loading state, helpful for displaying loading indicator
  void stopLoading() => emit(state.copyWith(loading: false));

  /// Dispatches paginationLoading state, helpful for displaying loading indicator
  void startPaginationLoading() =>
      emit(state.copyWith(paginationLoading: true));

  /// Dispatches paginationLoading state, helpful for displaying loading indicator
  void stopPaginationLoading() =>
      emit(state.copyWith(paginationLoading: false));
}
