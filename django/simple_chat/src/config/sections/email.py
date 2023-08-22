import os

from .base import env

if os.getenv("EMAIL_URL"):
    EMAIL_CONFIG = env.email_url("EMAIL_URL")
    vars().update(EMAIL_CONFIG)

if os.getenv("IMAP_URL"):
    IMAP_CONFIG = env.email_url("IMAP_URL")

# EMAIL
EMAIL_BACKEND = env(
    "DJANGO_EMAIL_BACKEND",
    default="django.core.mail.backends.smtp.EmailBackend",
)
EMAIL_TIMEOUT = 5

DEFAULT_FROM_EMAIL = env(
    "DJANGO_DEFAULT_FROM_EMAIL", default="djangoflow-df-chat <support@apexive.com>"
)
EMAIL_SUBJECT_PREFIX = env(
    "DJANGO_EMAIL_SUBJECT_PREFIX",
    default="[DjangoFlow]",
)

ANYMAIL = {
    "MAILGUN_API_URL": "https://api.eu.mailgun.net/v3",
}

if EMAIL_BACKEND == "anymail.backends.mailgun.EmailBackend":
    ANYMAIL["MAILGUN_API_KEY"] = env("MAILGUN_API_KEY")
