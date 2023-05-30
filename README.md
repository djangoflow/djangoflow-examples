# djangoflow-examples

A collection of samle djangoflow projects showcasing the framework

## What's here?

[/simple_chat](./simple_chat/) - A simple chat app with djangoflow backend

- [frontend-flutter](./simple_chat/frontend-flutter/) - An example flutter application showcasing a simple chat application. Follow [README](./simple_chat/frontend-flutter/README.md) to learn more.
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
