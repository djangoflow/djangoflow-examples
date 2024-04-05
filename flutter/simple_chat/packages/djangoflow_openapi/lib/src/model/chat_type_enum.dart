//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// * `group` - Group Chat * `private` - Private Chat
enum ChatTypeEnum {
  /// * `group` - Group Chat * `private` - Private Chat
  @JsonValue(r'group')
  group(r'group'),
  /// * `group` - Group Chat * `private` - Private Chat
  @JsonValue(r'private')
  private(r'private');

  const ChatTypeEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
