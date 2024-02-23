from df_api_drf.defaults import (
    DF_API_DRF_INSTALLED_APPS,
)
from df_api_drf.defaults import (
    REST_FRAMEWORK as DEFAULT_REST_FRAMEWORK,
)
from df_api_drf.defaults import (
    SPECTACULAR_SETTINGS as DEFAULT_SPECTACULAR_SETTINGS,
)

from df_chat.defaults import DF_CHAT_INSTALLED_APPS, get_redis_channel_layer

DEBUG = True

ROOT_URLCONF = "urls"
SECRET_KEY = "111111"

DEFAULT_AUTO_FIELD = "django.db.models.AutoField"
# AUTH_USER_MODEL = "test_app.User"

AUTHENTICATION_BACKENDS = [
    "django.contrib.auth.backends.ModelBackend",
]

INSTALLED_APPS = [
    "daphne",
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.sites",
    "django.contrib.messages",
    *DF_API_DRF_INSTALLED_APPS,
    *DF_CHAT_INSTALLED_APPS,
    "django.contrib.staticfiles",
]

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]
ASGI_APPLICATION = "asgi.application"
TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
            "loaders": [
                "django.template.loaders.filesystem.Loader",
                "django.template.loaders.app_directories.Loader",
            ],
        },
    },
]

SITE_ID = 1

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": "db.sqlite3",
    }
}

LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
        },
    },
    "root": {
        "handlers": ["console"],
        "level": "INFO",
    },
}

STATIC_URL = "/static/"

ALLOWED_HOSTS = ["*"]

REST_FRAMEWORK = {
    **DEFAULT_REST_FRAMEWORK,
    "DEFAULT_AUTHENTICATION_CLASSES": [
        "rest_framework.authentication.SessionAuthentication",
        "rest_framework.authentication.TokenAuthentication",
    ],
}

SPECTACULAR_SETTINGS = {
    **DEFAULT_SPECTACULAR_SETTINGS,
}

# Local in-memory backend
# Check if os.getenv("REDIS_URL") exists
if not DEBUG:
    CHANNEL_LAYERS = get_redis_channel_layer()
else:
    CHANNEL_LAYERS = {"default": {"BACKEND": "channels.layers.InMemoryChannelLayer"}}
