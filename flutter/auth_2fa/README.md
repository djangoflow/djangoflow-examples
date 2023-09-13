# DjangoFlow Auth 2FA Flutter Example

Welcome to the DjangoFlow Auth Flutter Example! This example demonstrates how to use the `djangoflow_auth` package along with 2FA verification.

Follow the steps below to set up the project on your local machine.

## BEFORE RUNNING THE APP TODO

- [x] Install and run local backend server for [django-df-auth](https://github.com/djangoflow/django-df-auth), please follow steps in [README](../../django/simple_auth/README.md) to run the example backend for django.
- [x] OpenAPI client repository is already generated in local `djangoflow_openapi` pacakge. If needed, to generate OpenAPI client repository from local server by using the following command `sh ../../tools/generate-openapi.sh -l` and this will create/updated a `djangoflow_openapi` package in [djangoflow_openapi package](./packages/djangoflow_openapi/) directory. (Note: You must re-generate this everytime schema/endpoint changes from backend/server side)
- [x] Generate api_repository,freezed, json_serializable etc files by running `make run-build_runner`(you must regenerate this whenever openapi changes).

## RUNNING THE APP

- run `make init`
- run `make run`

The example app should now be running on your local machine. You can explore the authentication flows for 2FA verification.
