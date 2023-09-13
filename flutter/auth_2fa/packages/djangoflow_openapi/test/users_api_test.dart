import 'package:test/test.dart';
import 'package:djangoflow_openapi/djangoflow_openapi.dart';


/// tests for UsersApi
void main() {
  final instance = DjangoflowOpenapi().getUsersApi();

  group(UsersApi, () {
    //Future<User> usersUsersPartialUpdate(String id, { PatchedUserRequest patchedUserRequest }) async
    test('test usersUsersPartialUpdate', () async {
      // TODO
    });

    //Future<User> usersUsersRetrieve(String id) async
    test('test usersUsersRetrieve', () async {
      // TODO
    });

    //Future<User> usersUsersUpdate(String id, { UserRequest userRequest }) async
    test('test usersUsersUpdate', () async {
      // TODO
    });

  });
}
