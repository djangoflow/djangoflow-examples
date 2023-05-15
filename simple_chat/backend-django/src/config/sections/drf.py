from .base import DEBUG

REST_FRAMEWORK = {
    "EXCEPTION_HANDLER": "core.drf.exceptions.errors_formatter_exception_handler",
    "DEFAULT_AUTHENTICATION_CLASSES": (
        "rest_framework_simplejwt.authentication.JWTAuthentication",
    ),
    "DEFAULT_PERMISSION_CLASSES": ("rest_framework.permissions.IsAuthenticated",),
    "DEFAULT_VERSIONING_CLASS": "rest_framework.versioning.NamespaceVersioning",
    "COERCE_DECIMAL_TO_STRING": False,
    "DEFAULT_THROTTLE_CLASSES": [
        "rest_framework.throttling.AnonRateThrottle",
        "rest_framework.throttling.UserRateThrottle",
    ],
    "PAGE_SIZE": 100,
    "TIME_FORMAT": "%H:%M",
    "DEFAULT_PAGINATION_CLASS": "rest_framework.pagination.LimitOffsetPagination",
    "DEFAULT_THROTTLE_RATES": {"anon": "100/min", "user": "1000/min"},
    "DEFAULT_SCHEMA_CLASS": "core.drf.openapi.AutoSchema",
}

SPECTACULAR_SETTINGS = {
    "TITLE": "djangoflow-df-chat API",
    "DESCRIPTION": "djangoflow-df-chat",
    "VERSION": "1.0.0",
    "SERVE_INCLUDE_SCHEMA": False,
    "SWAGGER_UI_DIST": "SIDECAR",  # shorthand to use the sidecar instead
    "SWAGGER_UI_FAVICON_HREF": "SIDECAR",
    "REDOC_DIST": "SIDECAR",
    "SCHEMA_PATH_PREFIX": "/api/v1",
    "COMPONENT_SPLIT_REQUEST": True,
    "COMPONENT_NO_READ_ONLY_REQUIRED": True,
    # "ENUM_NAME_OVERRIDES": {"GenderEnum": "accounts.models.Gender"},
    "ENUM_ADD_EXPLICIT_BLANK_NULL_CHOICE": False,
}

if DEBUG:
    REST_FRAMEWORK["DEFAULT_AUTHENTICATION_CLASSES"] += (
        "rest_framework.authentication.SessionAuthentication",
    )
