# DjangoFlow Auth 2FA Flutter Example

Welcome to the DjangoFlow Auth Flutter Example! This example demonstrates how to use the `djangoflow_auth` package along with 2FA verification.

Follow the steps below to set up the project on your local machine.

## BEFORE RUNNING THE APP TODO
Please check this check-list before running to app.
- [ ] Install and run local backend server for [django-df-auth](https://github.com/djangoflow/django-df-auth), please follow steps in [README](../../django/simple_auth/README.md) to run the example backend for django.
- [x] OpenAPI client repository is already generated in local `djangoflow_openapi` pacakge. If needed,
    - run this command to re-generate `djangoflow_openapi` locally.
    ```bash
    curl -sSL https://raw.githubusercontent.com/djangoflow/flutter-djangoflow/main/packages/djangoflow_openapi_extensions/tool/generate-openapi.sh | sh
    ```
    - run this command to generate `copyWith` extensions for `djangoflow_openapi`'s models
    ```bash
    curl -sSL https://raw.githubusercontent.com/djangoflow/flutter-djangoflow/main/packages/djangoflow_openapi_extensions/tool/generate-openapi-copywith.sh | sh
    ```
This will create/update the local `djangoflow_openapi` package in [djangoflow_openapi package](./packages/djangoflow_openapi/) directory. (Note: You must re-generate this everytime schema/endpoint changes from backend/server side)
- [ ] Running `make init` already covers this but if needed to generate api_repository,freezed, json_serializable etc files please hit this command: `make run-build_runner`(you must regenerate this whenever openapi changes).

## RUNNING THE APP

- run `make init`
- run `make run`

The example app should now be running on your local machine. You can explore the authentication flows for 2FA verification.
