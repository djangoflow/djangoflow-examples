from core.exceptions import AdminError
from django.contrib import messages
from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError
from django.shortcuts import redirect
from django.template.response import TemplateResponse

User = get_user_model()

try:
    from django.utils.deprecation import MiddlewareMixin
except ImportError:
    MiddlewareMixin = object


class AdminCustomErrorHandlingMiddleware(MiddlewareMixin):
    def process_exception(self, request, exception):
        if (
            request.META.get("CONTENT_TYPE") == "application/x-www-form-urlencoded"
            and request.user.is_authenticated
            and request.user.is_staff
        ):
            if isinstance(exception, ValidationError) or isinstance(
                exception, AdminError
            ):
                messages.error(request, str(exception))
                return redirect(request.META["HTTP_REFERER"])
            return TemplateResponse(
                request, "admin/error_handler.html", {"messages": [str(exception)]}
            )


class ForceDefaultLanguageMiddleware(MiddlewareMixin):
    """
    Ignore Accept-Language HTTP headers

    This will force the I18N machinery to always choose settings.LANGUAGE_CODE
    as the default initial language, unless another one is set via sessions or cookies

    Should be installed *before* any middleware that checks request.META['HTTP_ACCEPT_LANGUAGE'],
    namely django.middleware.locale.LocaleMiddleware
    """

    def process_request(self, request):
        if "HTTP_ACCEPT_LANGUAGE" in request.META:
            del request.META["HTTP_ACCEPT_LANGUAGE"]
