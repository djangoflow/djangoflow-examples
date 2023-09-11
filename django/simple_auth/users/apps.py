from django.apps import AppConfig


class UsersAppConfig(AppConfig):
    name = "users"

    class DFMeta:
        api_path = "users/"
