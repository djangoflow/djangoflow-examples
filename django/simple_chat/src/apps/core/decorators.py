import functools
import logging
import time

from django.conf import settings
from django.db import connection, reset_queries


def query_debugger(func):
    if settings.DEBUG:

        @functools.wraps(func)
        def inner_func(*args, **kwargs):
            reset_queries()

            start_queries = len(connection.queries)

            start = time.perf_counter()
            result = func(*args, **kwargs)
            end = time.perf_counter()

            end_queries = len(connection.queries)

            logging.info(f"Function : {func.__name__}")
            logging.info(f"Number of Queries : {end_queries - start_queries}")
            logging.info(f"Finished in : {(end - start):.2f}s")
            return result

        return inner_func
    return func


def safe_model_call(message: str = None):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(self, *args, **kwargs):
            try:
                return func(self, *args, **kwargs)
            except Exception as exception:  # noqa
                logging.error(message.format(self.pk, str(exception)) or str(exception))

        return wrapper

    return decorator
