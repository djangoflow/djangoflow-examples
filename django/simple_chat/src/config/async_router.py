from importlib import import_module

from channels.routing import URLRouter
from django.apps import apps
from django.urls import path

urlpatterns = [
    path(
        f"ws/{app.asgi_prefix}",
        URLRouter(import_module(f"{app.name}.asgi.urls").urlpatterns),
    )
    for app in apps.get_app_configs()
    if hasattr(app, "asgi_prefix")
]
