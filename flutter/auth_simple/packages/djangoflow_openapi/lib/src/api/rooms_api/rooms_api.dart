import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../model/pagination_rooms_entity/pagination_rooms_entity.dart';

part 'rooms_api.g.dart';

@RestApi()
abstract class RoomsApi {
  factory RoomsApi(Dio dio, {String baseUrl}) = _RoomsApi;

  @GET('/api/v1/chat/rooms/')
  Future<PaginationRoomsEntity> getRooms({
    @Query('limit') int limit = 20,
    @Query('offset') int offset = 0,
  });
}
