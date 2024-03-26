// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_token_obtain_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SocialTokenObtainRequestCWProxy {
  SocialTokenObtainRequest accessToken(String accessToken);

  SocialTokenObtainRequest provider(ProviderEnum provider);

  SocialTokenObtainRequest firstName(String? firstName);

  SocialTokenObtainRequest lastName(String? lastName);

  SocialTokenObtainRequest otp(String? otp);

  SocialTokenObtainRequest password(String? password);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SocialTokenObtainRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SocialTokenObtainRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SocialTokenObtainRequest call({
    String? accessToken,
    ProviderEnum? provider,
    String? firstName,
    String? lastName,
    String? otp,
    String? password,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSocialTokenObtainRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSocialTokenObtainRequest.copyWith.fieldName(...)`
class _$SocialTokenObtainRequestCWProxyImpl
    implements _$SocialTokenObtainRequestCWProxy {
  const _$SocialTokenObtainRequestCWProxyImpl(this._value);

  final SocialTokenObtainRequest _value;

  @override
  SocialTokenObtainRequest accessToken(String accessToken) =>
      this(accessToken: accessToken);

  @override
  SocialTokenObtainRequest provider(ProviderEnum provider) =>
      this(provider: provider);

  @override
  SocialTokenObtainRequest firstName(String? firstName) =>
      this(firstName: firstName);

  @override
  SocialTokenObtainRequest lastName(String? lastName) =>
      this(lastName: lastName);

  @override
  SocialTokenObtainRequest otp(String? otp) => this(otp: otp);

  @override
  SocialTokenObtainRequest password(String? password) =>
      this(password: password);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SocialTokenObtainRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SocialTokenObtainRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SocialTokenObtainRequest call({
    Object? accessToken = const $CopyWithPlaceholder(),
    Object? provider = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? otp = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
  }) {
    return SocialTokenObtainRequest(
      accessToken:
          accessToken == const $CopyWithPlaceholder() || accessToken == null
              ? _value.accessToken
              // ignore: cast_nullable_to_non_nullable
              : accessToken as String,
      provider: provider == const $CopyWithPlaceholder() || provider == null
          ? _value.provider
          // ignore: cast_nullable_to_non_nullable
          : provider as ProviderEnum,
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
      otp: otp == const $CopyWithPlaceholder()
          ? _value.otp
          // ignore: cast_nullable_to_non_nullable
          : otp as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
    );
  }
}

extension $SocialTokenObtainRequestCopyWith on SocialTokenObtainRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSocialTokenObtainRequest.copyWith(...)` or like so:`instanceOfSocialTokenObtainRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SocialTokenObtainRequestCWProxy get copyWith =>
      _$SocialTokenObtainRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialTokenObtainRequest _$SocialTokenObtainRequestFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SocialTokenObtainRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['access_token', 'provider'],
        );
        final val = SocialTokenObtainRequest(
          accessToken: $checkedConvert('access_token', (v) => v as String),
          provider: $checkedConvert(
              'provider', (v) => $enumDecode(_$ProviderEnumEnumMap, v)),
          firstName: $checkedConvert('first_name', (v) => v as String?),
          lastName: $checkedConvert('last_name', (v) => v as String?),
          otp: $checkedConvert('otp', (v) => v as String?),
          password: $checkedConvert('password', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'accessToken': 'access_token',
        'firstName': 'first_name',
        'lastName': 'last_name'
      },
    );

Map<String, dynamic> _$SocialTokenObtainRequestToJson(
    SocialTokenObtainRequest instance) {
  final val = <String, dynamic>{
    'access_token': instance.accessToken,
    'provider': _$ProviderEnumEnumMap[instance.provider]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('otp', instance.otp);
  writeNotNull('password', instance.password);
  return val;
}

const _$ProviderEnumEnumMap = {
  ProviderEnum.googleOauth2: 'google-oauth2',
  ProviderEnum.facebook: 'facebook',
  ProviderEnum.appleId: 'apple-id',
  ProviderEnum.twitter: 'twitter',
  ProviderEnum.discord: 'discord',
};
