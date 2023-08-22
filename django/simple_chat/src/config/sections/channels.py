from .base import env

ASGI_APPLICATION = "config.asgi.application"
CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels_redis.pubsub.RedisPubSubChannelLayer",
        "CONFIG": {
            "hosts": [env("REDIS_URL", default="redis://127.0.0.1:6379/2")],
        },
    },
}
