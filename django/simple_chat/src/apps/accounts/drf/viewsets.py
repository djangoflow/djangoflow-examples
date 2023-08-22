from core.drf.permissions import IsOwner
from rest_framework.mixins import RetrieveModelMixin, UpdateModelMixin
from rest_framework.viewsets import GenericViewSet

from ..models import User
from .serializers import UserSerializer


class UserViewSet(RetrieveModelMixin, UpdateModelMixin, GenericViewSet):
    permission_classes = (IsOwner,)
    serializer_class = UserSerializer
    queryset = User.objects.filter(is_active=True)

    def get_object(self):
        """
        Handles special case of '0' or 0 or '_' meaning current user
        :return: requested user details
        """
        lookup_url_kwarg = self.lookup_url_kwarg or self.lookup_field
        if self.kwargs[lookup_url_kwarg] in (0, "0", "_"):
            self.kwargs[lookup_url_kwarg] = self.request.user.id
        return super().get_object()
