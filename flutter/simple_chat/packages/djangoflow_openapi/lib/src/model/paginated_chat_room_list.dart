import 'package:copy_with_extension/copy_with_extension.dart';
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:djangoflow_openapi/src/model/chat_room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_chat_room_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaginatedChatRoomList {
  /// Returns a new [PaginatedChatRoomList] instance.
  PaginatedChatRoomList({

     this.count,

     this.next,

     this.previous,

     this.results,
  });

  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false
  )


  final int? count;



  @JsonKey(
    
    name: r'next',
    required: false,
    includeIfNull: false
  )


  final String? next;



  @JsonKey(
    
    name: r'previous',
    required: false,
    includeIfNull: false
  )


  final String? previous;



  @JsonKey(
    
    name: r'results',
    required: false,
    includeIfNull: false
  )


  final List<ChatRoom>? results;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PaginatedChatRoomList &&
     other.count == count &&
     other.next == next &&
     other.previous == previous &&
     other.results == results;

  @override
  int get hashCode =>
    count.hashCode +
    (next == null ? 0 : next.hashCode) +
    (previous == null ? 0 : previous.hashCode) +
    results.hashCode;

  factory PaginatedChatRoomList.fromJson(Map<String, dynamic> json) => _$PaginatedChatRoomListFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedChatRoomListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

