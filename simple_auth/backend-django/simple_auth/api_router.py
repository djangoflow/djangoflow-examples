from django.apps import apps
from django.conf.urls import include
from django.urls import path
from drf_spectacular.views import (
    SpectacularAPIView,
    SpectacularRedocView,
    SpectacularSwaggerView,
)

app_name = "api"


urlpatterns = [
    path(f"{app.api_path}", include(f"{app.name}.drf.urls"))
    for app in apps.get_app_configs()
    if hasattr(app, "api_path")
]

urlpatterns += [
    path("schema/", SpectacularAPIView.as_view(), name="schema"),
    path("", SpectacularRedocView.as_view(url_name="schema"), name="redoc"),
    path(
        "swagger/", SpectacularSwaggerView.as_view(url_name="schema"), name="swagger-ui"
    ),
]
