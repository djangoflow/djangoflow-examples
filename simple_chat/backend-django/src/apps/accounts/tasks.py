from config.celery_app import app

from .models import User


@app.task()
def task_send_email():
    """A pointless Celery task to demonstrate usage."""
    return User.objects.count()
