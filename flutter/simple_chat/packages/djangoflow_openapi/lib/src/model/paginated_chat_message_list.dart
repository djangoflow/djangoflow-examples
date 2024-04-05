import 'package:copy_with_extension/copy_with_extension.dart';
//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:djangoflow_openapi/src/model/chat_message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_chat_message_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaginatedChatMessageList {
  /// Returns a new [PaginatedChatMessageList] instance.
  PaginatedChatMessageList({

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


  final List<ChatMessage>? results;



  @override
  bool operator ==(Object other) => identical(this, other) || other is PaginatedChatMessageList &&
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

  factory PaginatedChatMessageList.fromJson(Map<String, dynamic> json) => _$PaginatedChatMessageListFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedChatMessageListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

