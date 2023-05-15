# TODO this needs ot be refactored from ground up
from .base import env

DJANGO_LOG_LEVEL = env.str("DJANGO_LOG_LEVEL", "INFO")

# LOGGING
# ------------------------------------------------------------------------------
LOGGING_HANDLER_CLASS = env.str("DJANGO_LOGGING_HANDLER_CLASS", "logging.StreamHandler")
LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "verbose": {
            "format": "%(levelname)s %(asctime)s %(module)s "
            "%(process)d %(thread)d %(message)s"
        }
    },
    "handlers": {
        "console": {
            "level": DJANGO_LOG_LEVEL,
            "class": LOGGING_HANDLER_CLASS,
            "formatter": "verbose",
        }
    },
    "loggers": {
        "sentry_sdk": {"level": "ERROR", "handlers": ["console"], "propagate": False},
    },
    "root": {"level": DJANGO_LOG_LEVEL, "handlers": ["console"]},
}

if LOGGING_HANDLER_CLASS != "logging.StreamHandler":
    from celery.signals import after_setup_logger, after_setup_task_logger

    @after_setup_logger.connect
    @after_setup_task_logger.connect
    def setup_celery_logging(logger, **kwargs):
        from django.utils.module_loading import import_string

        handler = import_string(LOGGING_HANDLER_CLASS)

        for h in logger.handlers:
            logger.removeHandler(h)
        logger.addHandler(handler())
