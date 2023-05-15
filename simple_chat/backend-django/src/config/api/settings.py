from ..settings.production import *

INSTALLED_APPS = CORE_APPS + CORE_EXTENSIONS + LOCAL_APPS + PRODUCTION_APPS
ROOT_URLCONF = "config.api.urls"
