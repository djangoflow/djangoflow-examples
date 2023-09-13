# djangoflow_openapi.api.UsersApi

## Load the API package
```dart
import 'package:djangoflow_openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersUsersPartialUpdate**](UsersApi.md#usersuserspartialupdate) | **PATCH** /api/v1/users/users/{id}/ | 
[**usersUsersRetrieve**](UsersApi.md#usersusersretrieve) | **GET** /api/v1/users/users/{id}/ | 
[**usersUsersUpdate**](UsersApi.md#usersusersupdate) | **PUT** /api/v1/users/users/{id}/ | 


# **usersUsersPartialUpdate**
> User usersUsersPartialUpdate(id, patchedUserRequest)



### Example
```dart
import 'package:djangoflow_openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP basic authorization: jwtAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('jwtAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('jwtAuth').password = 'YOUR_PASSWORD';

final api = DjangoflowOpenapi().getUsersApi();
final String id = id_example; // String | 
final PatchedUserRequest patchedUserRequest = ; // PatchedUserRequest | 

try {
    final response = api.usersUsersPartialUpdate(id, patchedUserRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling UsersApi->usersUsersPartialUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **patchedUserRequest** | [**PatchedUserRequest**](PatchedUserRequest.md)|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [jwtAuth](../README.md#jwtAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUsersRetrieve**
> User usersUsersRetrieve(id)



### Example
```dart
import 'package:djangoflow_openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP basic authorization: jwtAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('jwtAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('jwtAuth').password = 'YOUR_PASSWORD';

final api = DjangoflowOpenapi().getUsersApi();
final String id = id_example; // String | 

try {
    final response = api.usersUsersRetrieve(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling UsersApi->usersUsersRetrieve: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**User**](User.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [jwtAuth](../README.md#jwtAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **usersUsersUpdate**
> User usersUsersUpdate(id, userRequest)



### Example
```dart
import 'package:djangoflow_openapi/api.dart';
// TODO Configure API key authorization: cookieAuth
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('cookieAuth').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP basic authorization: jwtAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('jwtAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('jwtAuth').password = 'YOUR_PASSWORD';

final api = DjangoflowOpenapi().getUsersApi();
final String id = id_example; // String | 
final UserRequest userRequest = ; // UserRequest | 

try {
    final response = api.usersUsersUpdate(id, userRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling UsersApi->usersUsersUpdate: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **userRequest** | [**UserRequest**](UserRequest.md)|  | [optional] 

### Return type

[**User**](User.md)

### Authorization

[cookieAuth](../README.md#cookieAuth), [jwtAuth](../README.md#jwtAuth)

### HTTP request headers

 - **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

