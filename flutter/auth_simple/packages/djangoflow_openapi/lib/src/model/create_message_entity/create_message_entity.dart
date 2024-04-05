//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'create_message_entity.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateMessageEntity {
  /// Returns a new [CreateMessageEntity] instance.
  CreateMessageEntity({
    required this.message,
  });

  @JsonKey(name: r'message', required: true, includeIfNull: false)
  final String message;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateMessageEntity && other.message == message;

  @override
  int get hashCode => message.hashCode;

  factory CreateMessageEntity.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMessageEntityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
