//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Error {
  /// Returns a new [Error] instance.
  Error({
    required this.message,
    required this.code,
    this.field,
    this.extraData,
  });

  @JsonKey(name: r'message', required: true, includeIfNull: false)
  final String message;

  @JsonKey(name: r'code', required: true, includeIfNull: false)
  final String code;

  @JsonKey(name: r'field', required: false, includeIfNull: false)
  final String? field;

  @JsonKey(name: r'extra_data', required: false, includeIfNull: false)
  final Map<String, Object>? extraData;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Error &&
          other.message == message &&
          other.code == code &&
          other.field == field &&
          other.extraData == extraData;

  @override
  int get hashCode =>
      message.hashCode + code.hashCode + field.hashCode + extraData.hashCode;

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
