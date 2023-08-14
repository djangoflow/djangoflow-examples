# DjangoFlow Auth Flutter Example

Welcome to the DjangoFlow Auth Flutter Example! This example demonstrates how to use the `djangoflow_auth` package along with additional social authentication packages like Google, Facebook, Apple, and Discord.This example demonstrates how to use the following packages for seamless authentication integration:

- [djangoflow_auth]('https://pub.dev/packages/djangoflow_auth')
- [djangoflow_auth_apple]('https://pub.dev/packages/djangoflow_auth_apple')
- [djangoflow_auth_discord]('https://pub.dev/packages/djangoflow_auth_discord')
- [djangoflow_auth_facebook]('https://pub.dev/packages/djangoflow_auth_facebook')
- [djangoflow_auth_google]('https://pub.dev/packages/djangoflow_auth_google')

Follow the steps below to set up the project on your local machine.

## BEFORE RUNNING THE APP TODO

- [x] Install and run local backend server for [django-df-auth](https://github.com/djangoflow/django-df-auth), please follow steps in [README](https://github.com/djangoflow/djangoflow-examples/tree/main/simple_auth/backend-django#readme) to run the example backend for django.
- [x] OpenAPI client repository is already generated in local `djangoflow_openapi` pacakge. If needed, to generate OpenAPI client repository from local server by using the following command `sh ./tools/generate-openapi.sh -l` and this will create/updated a `djangoflow_openapi` package in [djangoflow_openapi package](../djangoflow_openapi/) directory. (Note: You must re-generate this everytime schema/endpoint changes from backend/server side)
- [x] Install melos if you haven't yet by running `dart pub global activate melos`
- [x] Generate api_repository,freezed, json_serializable, auto_route etc files by running `melos bs` at root directory of frontend-flutter (you must regenerate this whenever openapi changes).

## CONFIGURING SOCIAL LOGINS

Before you start, make sure you have the following installed and configured:

1. **Flutter**: Ensure you have the latest Flutter SDK installed on your system. You can download it from the [Flutter website](https://flutter.dev/docs/get-started/install).

2. **Firebase**: If you plan to use Google Sign-In and Firebase Authentication, you need to set up a Firebase project. Follow the [official Firebase documentation](https://firebase.google.com/docs/flutter/setup) to create a new project and obtain the `google-services.json` file for Android and the necessary configuration for iOS and Web.

3. **Facebook**: To enable Facebook authentication, create a Facebook App on the [Facebook for Developers](https://developers.facebook.com/apps/) platform. Obtain the Facebook App ID and configure the `facebook_app_id` in the Android `res/values/strings.xml` and iOS `Info.plist` files.

4. **Apple**: If you want to use Apple authentication, you'll need to set up an Apple Developer account and configure the necessary credentials. Follow the [official documentation](https://developer.apple.com/documentation/sign_in_with_apple) for Apple Sign-In to get your `appleAppId` and configure it in the `Info.plist` file.

5. **Discord**: For Discord authentication, create a Discord Developer Application on the [Discord Developer Portal](https://discord.com/developers/applications) to obtain the `clientId`. Ensure you also configure the OAuth2 Redirect URI.

## RUNNING THE APP

Run `flutter pub get` and after that `flutter pub run` to run the project.

## Organising

The way this project is organised inside the `packages/chat/lib` folder is as follows:

- `configurations` defines dynamic configurations per projects. These configurations are needed to setup the app which includes theme, router, global constants etc.
- `features` list of features according to their usage domain. Each of them are divided into 3 main layers
  - `data` bridge between business logic layer and external API with data manipulation. `presentation` should never directly communicate with this layer.
  - `blocs` is responsible for communicating with `data` and `presentation` layer. For specific events triggered from `presentation` layer, `blocs` layer will communicate with `data` layer to update information and perhapse update `state` of the `presentation` layer. The `state` should be immutable.
  - `presentation` is directly related to the UI of the app. It will send event to the `blocs` layer and listen to `state` dispatched from `blocs` layer to modify the UI.
- `utils` provides handy functionality that may be useful manipulate data and other useful functionalities.

## Getting Started

1. Clone the repository:

   ```
   git clone https://github.com/your-username/your-repo.git
   ```

2. Navigate to the project directory:

   ```
   cd your-repo
   ```

3. Replace the necessary files:

   - **Google Sign-In**: Replace `google-services.json` in the `android/app` directory with your own file from the Firebase project.

   - **Facebook**: Configure the `facebook_app_id` in the Android `res/values/strings.xml` and iOS `Info.plist` files.

   - **Apple**: Configure the `appleAppId` in the iOS `Info.plist` file.

   - **Discord**: Replace the `clientId` and configure the OAuth2 Redirect URI in the `lib/main.dart` file. And for mobile platforms, enable deep linking.

4. Run the app:
   ```
   flutter run
   ```

The example app should now be running on your local machine. You can explore the authentication flows for different social providers and test the functionality.

## Features

- Smooth integration with DjangoFlow and various social authentication providers.
- Login with Google, Facebook, Apple, and Discord accounts.
- Customizable permissions and login behavior for each provider.
- Easy-to-use and consistent APIs for social login.
