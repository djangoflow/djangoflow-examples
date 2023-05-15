from rest_framework import permissions
from rest_framework.fields import get_attribute


class IsOwner(permissions.BasePermission):
    def has_object_permission(self, request, view, obj):
        user_attribute = getattr(obj, "user_attribute", None)
        return (
            get_attribute(obj, user_attribute.split(".") if user_attribute else [])
            == request.user
        )


class IsOwnerOrReadOnly(IsOwner):
    def has_object_permission(self, request, view, obj):
        return bool(
            request.method in permissions.SAFE_METHODS
            or super().has_object_permission(request, view, obj)
        )
