import logging

from gunicorn.glogging import Logger as DefaultLogger


class HealthCheckFilter(logging.Filter):
    def filter(self, record):
        return "GET /healthz/" not in record.getMessage()


class Logger(DefaultLogger):
    def setup(self, cfg):
        super().setup(cfg)

        logger = logging.getLogger("gunicorn.access")
        logger.addFilter(HealthCheckFilter())


# TODO: setup proper google cloud handling
# logconfig_dict = {
#     "handlers": {
#         "console": {
#             "class": "google.cloud.logging_v2.handlers.ContainerEngineHandler",
#             "level": "WARN",
#         },
#         "error_console": {
#             "class": "google.cloud.logging_v2.handlers.ContainerEngineHandler",
#             "level": "WARN",
#         },
#     }
# }

logger_class = Logger
