from core.drf.permissions import IsOwner
from rest_framework.viewsets import ModelViewSet


class ModelOwnerViewSet(ModelViewSet):
    permission_classes = (IsOwner,)

    def get_queryset(self):
        user_attribute = getattr(self.queryset.model, "user_attribute", "user")
        return (
            self.queryset.filter(**{user_attribute: self.request.user})
            if self.request.user.is_authenticated
            else self.queryset.none()
        )
