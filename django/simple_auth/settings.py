import os

from df_api_drf.defaults import (
    DF_API_DRF_INSTALLED_APPS,
    REST_FRAMEWORK,
    SPECTACULAR_SETTINGS,
)

from df_auth.defaults import DF_AUTH_INSTALLED_APPS, SOCIAL_AUTH_PIPELINE




DEBUG = True

ROOT_URLCONF = "urls"
SECRET_KEY = "111111"  # noqa: S105

DEFAULT_AUTO_FIELD = "django.db.models.AutoField"

USE_TZ = True


AUTH_USER_MODEL = "users.User"

INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.sites",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    *DF_API_DRF_INSTALLED_APPS,
    *DF_AUTH_INSTALLED_APPS,
    "users",
]

EMAIL_BACKEND = "django.core.mail.backends.console.EmailBackend"

MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "corsheaders.middleware.CorsMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
]

CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True

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

DF_AUTH = {
    "USER_IDENTITY_FIELDS": {
        "email": "rest_framework.serializers.EmailField",
    }
}

AUTHENTICATION_BACKENDS = [
    "df_auth.backends.TestEmailBackend",
    "df_auth.backends.TwilioSMSOTPBackend",
    "df_auth.backends.EmailOTPBackend",
    "django.contrib.auth.backends.ModelBackend",
    "social_core.backends.google.GoogleOAuth2",
    "social_core.backends.facebook.FacebookOAuth2",
    "social_core.backends.apple.AppleIdAuth",
    "social_core.backends.twitter.TwitterOAuth",
    "social_core.backends.discord.DiscordOAuth2",
]

REST_FRAMEWORK = {**REST_FRAMEWORK}
REST_FRAMEWORK["DEFAULT_AUTHENTICATION_CLASSES"] += (
    "rest_framework.authentication.SessionAuthentication",
)

SPECTACULAR_SETTINGS = {**SPECTACULAR_SETTINGS}

SOCIAL_AUTH_FACEBOOK_KEY = "xxxxxxx"
SOCIAL_AUTH_FACEBOOK_SECRET = "xxxxxxx"

