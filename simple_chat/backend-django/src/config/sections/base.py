from pathlib import Path

import environ

env = environ.Env(
    DJANGO_READ_ENV_FILE=(bool, False),
)
BASE_DIR = Path(__file__).resolve(strict=True).parent.parent.parent.parent

if env("DJANGO_READ_ENV_FILE"):
    env.read_env(str(BASE_DIR / ".env"))


# https://docs.djangoproject.com/en/dev/ref/settings/#secret-key
SECRET_KEY = env(
    "DJANGO_SECRET_KEY",
)

USE_I18N = True
USE_L10N = True
USE_TZ = True
TIME_ZONE = "Europe/Amsterdam"

CRISPY_TEMPLATE_PACK = "bootstrap4"
DEBUG = env.bool("DJANGO_DEBUG", True)
FIXTURE_DIRS = (str(BASE_DIR / "fixtures"),)
FORM_RENDERER = "django.forms.renderers.TemplatesSetting"
LANGUAGE_CODE = "en"
LOCALE_PATHS = [str(BASE_DIR / "locale")]
MIGRATION_MODULES = {"sites": "contrib.sites.migrations"}
ROOT_URLCONF = "config.urls"
SITE_ID = 1
WSGI_APPLICATION = "config.wsgi.application"
DEFAULT_AUTO_FIELD = "django.db.models.AutoField"
