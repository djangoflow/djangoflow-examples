# djangoflow-examples

A collection of samle djangoflow projects showcasing the framework

## What's here?

[/simple_auth](./simple_auth/) - A simple auth app with djangoflow backend

- [frontend-flutter](flutter/simple_auth/) - An example flutter application showcasing a simple auth application. Follow [README](flutter/simple_auth/packages/simple_auth/README.md) to learn more.
- backend-dango - Django backend

[/simple_chat](./simple_chat/) - A simple chat app with djangoflow backend

- [frontend-flutter](flutter/simple_chat/) - An example flutter application showcasing a simple chat application. Follow [README](flutter/simple_chat/packages/chat/README.md) to learn more.
- backend-dango - Django backend

## How to run the examples?

To run the example and fully test it, you must first run the backend example locally. Once the backend is running, the frontend will work as expected. Here are the steps to run the example:

- **Run the backend example**: TODO
- **Run the frontend example**:
  - Ensure that the local backend example is running.
  - Activate Melos globally by running the command `dart pub global activate melos`.
  - Navigate to the root directory of `frontend-flutter`.
  - Run `melos bs`, this will generate necessary Dart files.
  - Go to `frontend-flutter/packages/{module}` and execute the `flutter run` command to run the example application.
