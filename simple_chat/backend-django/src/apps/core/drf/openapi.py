from core.drf.serializers import ErrorResponseSerializer
from django.utils.translation import gettext_lazy as _
from drf_spectacular.contrib import *  # noqa: F403, F401
from drf_spectacular.openapi import AutoSchema as DefaultAutoSchema


class AutoSchema(DefaultAutoSchema):
    def get_response_serializers(self):
        response_serializers = (
            self.view.response_serializer_class
            if hasattr(self.view, "response_serializer_class")
            else super().get_response_serializers()
        )

        responses = {"400": ErrorResponseSerializer}

        if self.method == "DELETE":
            responses["204"] = {"description": _("No response body")}
        elif self._is_create_operation():
            responses["201"] = response_serializers
        else:
            responses["200"] = response_serializers
        return responses
