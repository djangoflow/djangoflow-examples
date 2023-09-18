# djangoflow-examples

A collection of samle djangoflow projects showcasing the framework

## What's here?

- `auth_simple` - A simple auth app with social logins and djangoflow backend

  - [frontend-flutter](flutter/auth_simple/) - An example flutter application showcasing a simple auth application. Follow [README](flutter/auth_simple/README.md) to learn more.

  - [backend-django](django/simple_auth/) - Django backend for `simple_auth` example.

- `auth_2fa` - A simple auth app with 2FA verification

  - [frontend-flutter](flutter/auth_2fa/) - An example flutter application showcasing a simple auth with 2FA application. Follow [README](flutter/auth_2fa/README.md) to learn more.

## How to run the examples?

To run the example and fully test it, you must first run the backend example locally. Once the backend is running, the frontend will work as expected. Here are the steps to run the example:

- **Run the `django` backend example**:
  - Navigate to the root directory of the example app(`django/{example_app}`).
  - run `make init` to initialize
  - run `make run` to run the application
- **Run the `flutter` frontend example**:
  - Navigate to the root directory of the example app(`flutter/{example_app}`).
  - run `make init` to initialize
  - run `make run` to run the application
