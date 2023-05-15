from django.urls import include, path
from django.views.generic import TemplateView

urlpatterns = [
    path("", TemplateView.as_view(template_name="pages/home.html"), name="home"),
    path("healthz/", include("health_check.urls")),
]

# API URLS
urlpatterns += [
    path("api/v0/", include("config.api_router", namespace="v0")),
]
