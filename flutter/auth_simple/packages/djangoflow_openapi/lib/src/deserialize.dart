import 'package:djangoflow_openapi/src/model/change_password_request/change_password_request.dart';
import 'package:djangoflow_openapi/src/model/error/error.dart';
import 'package:djangoflow_openapi/src/model/error_response/error_response.dart';
import 'package:djangoflow_openapi/src/model/otp_device/otp_device.dart';
import 'package:djangoflow_openapi/src/model/otp_device_confirm_request/otp_device_confirm_request.dart';
import 'package:djangoflow_openapi/src/model/otp_device_request/otp_device_request.dart';
import 'package:djangoflow_openapi/src/model/otp_obtain/otp_obtain.dart';
import 'package:djangoflow_openapi/src/model/otp_obtain_request/otp_obtain_request.dart';
import 'package:djangoflow_openapi/src/model/patched_user2_fa_request/patched_user2_fa_request.dart';
import 'package:djangoflow_openapi/src/model/patched_user_identity_request/patched_user_identity_request.dart';
import 'package:djangoflow_openapi/src/model/social_token_obtain_request/social_token_obtain_request.dart';
import 'package:djangoflow_openapi/src/model/token/token.dart';
import 'package:djangoflow_openapi/src/model/token_blacklist_request/token_blacklist_request.dart';
import 'package:djangoflow_openapi/src/model/token_obtain_request/token_obtain_request.dart';
import 'package:djangoflow_openapi/src/model/token_refresh_request/token_refresh_request.dart';
import 'package:djangoflow_openapi/src/model/token_verify_request/token_verify_request.dart';
import 'package:djangoflow_openapi/src/model/user2_fa/user2_fa.dart';
import 'package:djangoflow_openapi/src/model/user_identity/user_identity.dart';
import 'package:djangoflow_openapi/src/model/user_identity_request/user_identity_request.dart';

import 'model/paginated_otp_device_list/paginated_otp_device_list.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType,
    {bool growable = true}) {
  switch (targetType) {
    case 'String':
      return '$value' as ReturnType;
    case 'int':
      return (value is int ? value : int.parse('$value')) as ReturnType;
    case 'bool':
      if (value is bool) {
        return value as ReturnType;
      }
      final valueString = '$value'.toLowerCase();
      return (valueString == 'true' || valueString == '1') as ReturnType;
    case 'double':
      return (value is double ? value : double.parse('$value')) as ReturnType;
    case 'ChangePasswordRequest':
      return ChangePasswordRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Error':
      return Error.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ErrorResponse':
      return ErrorResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OTPDevice':
      return OTPDevice.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OTPDeviceConfirmRequest':
      return OTPDeviceConfirmRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OTPDeviceRequest':
      return OTPDeviceRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OTPObtain':
      return OTPObtain.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OTPObtainRequest':
      return OTPObtainRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PaginatedOTPDeviceList':
      return PaginatedOTPDeviceList.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PatchedUser2FARequest':
      return PatchedUser2FARequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PatchedUserIdentityRequest':
      return PatchedUserIdentityRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ProviderEnum':
    case 'SocialTokenObtainRequest':
      return SocialTokenObtainRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Token':
      return Token.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'TokenBlacklistRequest':
      return TokenBlacklistRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TokenObtainRequest':
      return TokenObtainRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TokenRefreshRequest':
      return TokenRefreshRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TokenVerifyRequest':
      return TokenVerifyRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TypeEnum':
    case 'User2FA':
      return User2FA.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'UserIdentity':
      return UserIdentity.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'UserIdentityRequest':
      return UserIdentityRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    default:
      RegExpMatch? match;

      if (value is List && (match = _regList.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toList(growable: growable) as ReturnType;
      }
      if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toSet() as ReturnType;
      }
      if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return Map<dynamic, BaseType>.fromIterables(
          value.keys,
          value.values.map((dynamic v) => deserialize<BaseType, BaseType>(
              v, targetType,
              growable: growable)),
        ) as ReturnType;
      }
      break;
  }
  throw Exception('Cannot deserialize');
}
