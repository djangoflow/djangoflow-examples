from .base import *

ALLOWED_HOSTS = env.list(
    "DJANGO_ALLOWED_HOSTS",
) + [env("POD_IP")]

DATABASES["default"] = env.db("DATABASE_URL")  # noqa F405
DATABASES["default"]["ATOMIC_REQUESTS"] = True  # noqa F405
DATABASES["default"]["CONN_MAX_AGE"] = env.int("CONN_MAX_AGE", default=60)  # noqa F405

CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.redis.RedisCache",
        "LOCATION": env("REDIS_URL"),
    }
}

SECURE_PROXY_SSL_HEADER = ("HTTP_X_FORWARDED_PROTO", "https")
SECURE_SSL_REDIRECT = env.bool("DJANGO_SECURE_SSL_REDIRECT", default=False)
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True
SECURE_HSTS_SECONDS = 60
SECURE_HSTS_INCLUDE_SUBDOMAINS = env.bool(
    "DJANGO_SECURE_HSTS_INCLUDE_SUBDOMAINS", default=True
)
SECURE_HSTS_PRELOAD = env.bool("DJANGO_SECURE_HSTS_PRELOAD", default=True)
SECURE_CONTENT_TYPE_NOSNIFF = env.bool(
    "DJANGO_SECURE_CONTENT_TYPE_NOSNIFF", default=True
)

GS_BUCKET_NAME = env("DJANGO_GCP_STORAGE_BUCKET_NAME")
# GS_DEFAULT_ACL = "publicRead"

STATICFILES_STORAGE = "config.storages.NoSourceMapsStorage"
DEFAULT_FILE_STORAGE = "config.storages.MediaRootGoogleCloudStorage"
MEDIA_HOST = env.str("DJANGO_MEDIA_HOST")
MEDIA_URL = f"https://{MEDIA_HOST}/media/"

STATIC_HOST = env.str("DJANGO_STATIC_HOST")
STATIC_URL = f"https://{STATIC_HOST}/static/"

TEMPLATES[-1]["OPTIONS"]["loaders"] = [  # type: ignore[index] # noqa F405
    (
        "django.template.loaders.cached.Loader",
        [
            "django.template.loaders.filesystem.Loader",
            "django.template.loaders.app_directories.Loader",
        ],
    )
]

ADMIN_URL = env("DJANGO_ADMIN_URL")
IMPORT_EXPORT_TMP_STORAGE_CLASS = "import_export.tmp_storages.CacheStorage"
INSTALLED_APPS = ADMIN_APPS + PRODUCTION_APPS
