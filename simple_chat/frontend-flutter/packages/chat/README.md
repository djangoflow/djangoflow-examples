# DFChat

A flutter application demonstrating integration of djangoflow_chat and [django-df-chat](https://github.com/djangoflow/django-df-chat)

This example uses [flutter_chat_ui](https://pub.dev/packages/flutter_chat_ui) as the Chat UIKIT, but `djangoflow_chat` can be integrated with other flutter chat related UIKITs as well.

## BEFORE RUNNING THE APP TODO

- [x] Install and run local backend server for [django-df-chat](https://github.com/djangoflow/django-df-chat), please follow steps in [README](https://github.com/djangoflow/djangoflow-examples/tree/main/simple_chat/backend-django#readme) to run the example backend for django. **It is very important to [create superusers](https://github.com/djangoflow/djangoflow-examples/tree/main/simple_chat/backend-django#readme) to login via the email, password in this example app.**
- [x] (**Skip if already generated**) Generate OpenAPI client repository from local server by using the following command `sh ./tools/generate-openapi.sh -l` and this will create a `openapi` package in [openapi package](../openapi/) directory. Add `openapi` package in `pubspec.yaml`, Also make sure you've added `openapi` package in `dependency_overrides:` section to override it. (Note: You must re-generate this everytime schema/endpoint changes from backend/server side)
- [x] Install melos if you haven't yet by running `dart pub global activate melos`
- [x] Generate api_repository,freezed, json_serializable, auto_route etc files by running `melos bs` at root directory (you must regenerate this whenever openapi changes).
- [x] Follow TODO comments for [auth_cubit.dart](packages/chat/lib/features/authentication/blocs/auth_cubit.dart)

## Organising

The way this project is organised inside the `packages/chat/lib` folder is as follows:

- `configurations` defines dynamic configurations per projects. These configurations are needed to setup the app which includes theme, router, global constants etc.
- `features` list of features according to their usage domain. Each of them are divided into 3 main layers
  - `data` bridge between business logic layer and external API with data manipulation. `presentation` should never directly communicate with this layer.
  - `blocs` is responsible for communicating with `data` and `presentation` layer. For specific events triggered from `presentation` layer, `blocs` layer will communicate with `data` layer to update information and perhapse update `state` of the `presentation` layer. The `state` should be immutable.
  - `presentation` is directly related to the UI of the app. It will send event to the `blocs` layer and listen to `state` dispatched from `blocs` layer to modify the UI.
- `utils` provides handy functionality that may be useful manipulate data and other useful functionalities.

## RUNNING THE APP

Run `flutter pub get` and after that `flutter pub run` to run the project.

## SETUP

There can be few customizations/setup regarding various aspect of the project. We'll discuss how to use those customization to bootstrap project quickly.

### OPENAPI REPOSITORY AND BLOCS

Openapi repository can be generated easily by using the script inside `{project_name}/tools/generate-openapi.sh` file.

- Make sure inside the `generate-openapi.sh` file the `hostname` variable has proper api endpoint.
- Then go to {project_name} folder which contains the tools folder. and run `sh tools/generate-openapi.sh -d` command to generate the openapi repository. the `-d` flag will use development api endpoint and using `-l` will use the local api endpoint defined in the `generate-openapi.sh` file.

To generate the Bloc from openapi generated repository you will need to annotate the class that you want to keep your generated blocs, repository into with
`@OpenapiRepository` annotation. An example can be found [here](./lib/data/api_repository/api_repository.dart) and then run `flutter pub run build_runner build --delete-conflicting-outputs`. Voila you'll have the required `ListBloc` and `DataBloc` automatically generated. 'ListBloc`and`DataBloc` comes from another set of packages. Which you can find and learn more about here : https://github.com/apexlabs-ai/list_bloc/
