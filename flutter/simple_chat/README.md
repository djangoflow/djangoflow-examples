# DjangoFlow Simple Chat Flutter Example

Welcome to the DjangoFlow Simple Chat Flutter Example! This example demonstrates how to use the DjangoFlow's `simple_chat` as the backend along with `djangoflow_chat`.

Follow the steps below to set up the project on your local machine.

## BEFORE RUNNING THE APP TODO

Please check this check-list before running to app:

- [ ] Install and run local backend server for [django-df-chat](https://github.com/djangoflow/django-df-chat), please follow steps in [README](../../django/simple_chat/README.md) to run the example backend for django.
- [ ] OpenAPI client repository is already generated in local `djangoflow_openapi` pacakge. If needed, - run this command to re-generate `djangoflow_openapi` locally.
- [ ] Create a superuser for the Django admin using the command

```
  . ../../venv/bin/activate
  ./manage.py createsuperuser 
```

- [ ] In the root directory of the `simple_chat` backend app. Follow the prompts to provide an `email` and `password`. After creating `super user`, you will be able to login to the admin dashboard to manually add/remove/edit chat rooms, messages as you wish. Use http://127.0.0.1:8000/admin to access the admin dashboard.

## RUNNING THE APP

- run `make init`

This will create/update the local`djangoflow_openapi` package in [djangoflow_openapi package](./packages/djangoflow_openapi/) directory. (Note: You must re-generate this everytime schema/endpoint changes from backend/server side)

```bash
  # Run this to generate djangoflow_openapi locally
  sh ./tools/generate-openapi.sh
````

- run `make run`

The example app should now be running on your local machine. You can explore the Simple Chat feature.
