import os
import sys

from celery import Celery

sys.path.append("./src")
sys.path.append("./src/apps")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings.local")
# TODO change in template
app = Celery("df-chat")
app.config_from_object("django.conf:settings", namespace="CELERY")
app.autodiscover_tasks()
