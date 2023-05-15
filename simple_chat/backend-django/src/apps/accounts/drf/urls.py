from django.conf import settings
from rest_framework.routers import DefaultRouter, SimpleRouter

from .viewsets import UserViewSet

urlpatterns = []

if settings.DEBUG:
    router = DefaultRouter()
else:
    router = SimpleRouter()

router.register("users", UserViewSet, basename="users")

urlpatterns += router.urls
