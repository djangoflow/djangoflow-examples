//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// * `email` - email * `totp` - totp * `sms` - sms
enum TypeEnum {
  /// * `email` - email * `totp` - totp * `sms` - sms
  @JsonValue(r'email')
  email(r'email'),
  /// * `email` - email * `totp` - totp * `sms` - sms
  @JsonValue(r'totp')
  totp(r'totp'),
  /// * `email` - email * `totp` - totp * `sms` - sms
  @JsonValue(r'sms')
  sms(r'sms');

  const TypeEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
