from datetime import timedelta

from twilio.rest import Client

from .base import env

SIMPLE_JWT = {
    "ACCESS_TOKEN_LIFETIME": timedelta(days=14),
    "AUTH_HEADER_TYPES": ("Bearer",),
    "AUTH_TOKEN_CLASSES": ("rest_framework_simplejwt.tokens.SlidingToken",),
    "BLACKLIST_AFTER_ROTATION": False,
    "JTI_CLAIM": "jti",
    "REFRESH_TOKEN_LIFETIME": timedelta(days=14),
    "ROTATE_REFRESH_TOKENS": True,
    "SLIDING_TOKEN_LIFETIME": timedelta(days=14),
    "SLIDING_TOKEN_REFRESH_EXP_CLAIM": "refresh_exp",
    "SLIDING_TOKEN_REFRESH_LIFETIME": timedelta(days=14),
    "TOKEN_TYPE_CLAIM": "sliding",
    "USER_ID_CLAIM": "user_id",
    "USER_ID_FIELD": "id",
    "TOKEN_OBTAIN_SERIALIZER": "rest_framework_simplejwt.serializers.TokenObtainSlidingSerializer",
    "TOKEN_REFRESH_SERIALIZER": "rest_framework_simplejwt.serializers.TokenRefreshSlidingSerializer",
}

OTP_TWILIO_ACCOUNT = env.str("OTP_TWILIO_ACCOUNT", default=None)
OTP_TWILIO_AUTH = env.str("OTP_TWILIO_AUTH", default=None)
OTP_TWILIO_FROM = env.str("OTP_TWILIO_FROM", default=None)
OTP_TWILIO_TOKEN_VALIDITY = 300

OTP_EMAIL_TOKEN_VALIDITY = 300
OTP_EMAIL_BODY_TEMPLATE_PATH = "otp/email/token.txt"
OTP_EMAIL_BODY_HTML_TEMPLATE_PATH = "otp/email/token.html"
OTP_EMAIL_SUBJECT = "Your secret link to login to "

TWILIO_CLIENT = (
    Client(OTP_TWILIO_ACCOUNT, OTP_TWILIO_AUTH)
    if OTP_TWILIO_ACCOUNT and OTP_TWILIO_AUTH
    else None
)

SOCIAL_AUTH_URL_NAMESPACE = "v1:social"

AUTHENTICATION_BACKENDS = [
    "accounts.backends.EmailOTPBackend",
    "django.contrib.auth.backends.ModelBackend",
    "social_core.backends.google.GoogleOAuth2",
    "social_core.backends.facebook.FacebookOAuth2",
]
