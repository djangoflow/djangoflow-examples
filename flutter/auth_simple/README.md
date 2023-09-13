# DjangoFlow Auth Flutter Example

Welcome to the DjangoFlow Auth Flutter Example! This example demonstrates how to use the `djangoflow_auth` package along with additional social authentication packages like Google, Facebook, Apple, and Discord. This example demonstrates how to use the following packages for seamless authentication integration:

- [djangoflow_auth]('https://pub.dev/packages/djangoflow_auth')
- [djangoflow_auth_apple]('https://pub.dev/packages/djangoflow_auth_apple')
- [djangoflow_auth_discord]('https://pub.dev/packages/djangoflow_auth_discord')
- [djangoflow_auth_facebook]('https://pub.dev/packages/djangoflow_auth_facebook')
- [djangoflow_auth_google]('https://pub.dev/packages/djangoflow_auth_google')

Follow the steps below to set up the project on your local machine.

## BEFORE RUNNING THE APP TODO

- [x] Install and run local backend server for [django-df-auth](https://github.com/djangoflow/django-df-auth), please follow steps in [README](../../django/simple_auth/README.md) to run the example backend for django.
- [x] OpenAPI client repository is already generated in local `djangoflow_openapi` pacakge. If needed, to generate OpenAPI client repository from local server by using the following command `sh ../../tools/generate-openapi.sh -l` and this will create/updated a `djangoflow_openapi` package in [djangoflow_openapi package](./packages/djangoflow_openapi/) directory. (Note: You must re-generate this everytime schema/endpoint changes from backend/server side)
- [x] Generate api_repository,freezed, json_serializable etc files by running `make run-build_runner`(you must regenerate this whenever openapi changes).

## CONFIGURING SOCIAL LOGINS

Before you start, make sure you have the following installed and configured(some local configuration is already done, you can replace them with your own):

1. **Flutter**: Ensure you have the latest Flutter SDK installed on your system. You can download it from the [Flutter website](https://flutter.dev/docs/get-started/install).

2. **Firebase**: If you plan to use Google Sign-In and Firebase Authentication, you need to set up a Firebase project. Follow the [official Firebase documentation](https://firebase.google.com/docs/flutter/setup) to create a new project and obtain the `google-services.json` file for Android and the necessary configuration for iOS and Web. **Note:** Run web app on `51954` port to check the preconfigured google login for Auth Simple via `flutter run -d chrome --web-hostname localhost --web-port 51954`. If you want to use your own config then add valid origin urls in your google console for web.

3. **Facebook**: To enable Facebook authentication, create a Facebook App on the [Facebook for Developers](https://developers.facebook.com/apps/) platform. Obtain the Facebook App ID and configure the `facebook_app_id` in the Android `res/values/strings.xml` and iOS `Info.plist` files. Follow this link for official documentation [Facebook Login](https://developers.facebook.com/docs/facebook-login/)

4. **Apple**: If you want to use Apple authentication, you'll need to set up an Apple Developer account and configure the necessary credentials. Follow the [official documentation](https://developer.apple.com/documentation/sign_in_with_apple) for Apple Sign-In to get your `appleAppId` and configure it in the `Info.plist` file.

5. **Discord**: For Discord authentication, create a Discord Developer Application on the [Discord Developer Portal](https://discord.com/developers/applications) to obtain the `clientId`. Ensure you also configure the OAuth2 Redirect URI. You can use deep linking for mobile platforms. And custom html file for web. More info [djangoflow_auth_discord](https://pub.dev/packages/djangoflow_auth_discord)

## RUNNING THE APP

- run `make init`
- run `make run`

The example app should now be running on your local machine. You can explore the authentication flows for different social providers and test the functionality.
