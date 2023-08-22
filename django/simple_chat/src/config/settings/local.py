import os

from corsheaders.defaults import default_headers as cors_default_headers

os.environ["DJANGO_READ_ENV_FILE"] = "True"  # noqa

from ..sections.logging import LOGGING  # noqa E402
from .base import *  # noqa
from .base import MIDDLEWARE, env  # noqa E402

ALLOWED_HOSTS = ["localhost", "0.0.0.0", "127.0.0.1"]

CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.locmem.LocMemCache",
        "LOCATION": "",
    }
}

EMAIL_BACKEND = env(
    "DJANGO_EMAIL_BACKEND", default="django.core.mail.backends.console.EmailBackend"
)

INSTALLED_APPS = [
    "daphne",
    "whitenoise.runserver_nostatic",
    *ADMIN_APPS,
    "debug_toolbar",
    "corsheaders",
]
MIDDLEWARE += ["debug_toolbar.middleware.DebugToolbarMiddleware"]
DEBUG_TOOLBAR_CONFIG = {
    "DISABLE_PANELS": ["debug_toolbar.panels.redirects.RedirectsPanel"],
    "SHOW_TEMPLATE_CONTEXT": True,
}
INTERNAL_IPS = ["127.0.0.1", "10.0.2.2"]
CELERY_TASK_ALWAYS_EAGER = True
CELERY_TASK_EAGER_PROPAGATES = True

LOGGING["loggers"] = {
    "root": {
        "level": "DEBUG",
        "handlers": ["console"],
        "propagate": False,
    }
}

CORS_ALLOW_ALL_ORIGINS = True
CORS_URLS_REGEX = r"^/api/.*$"
CORS_ALLOW_HEADERS = cors_default_headers + ("accept-language", "cache-control")

DATABASES = {
    "default": env.db("DATABASE_URL", default=f"sqlite:////{BASE_DIR}/database.sqlite"),
}

CHANNEL_LAYERS = {"default": {"BACKEND": "channels.layers.InMemoryChannelLayer"}}
