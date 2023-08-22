DF_NOTIFICATIONS = {
    "CHANNELS": {
        "email": "df_notifications.channels.EmailChannel",
        "console": "df_notifications.channels.ConsoleChannel",
        "push": "alerts.channels.FirebasePushChannel",
        "webhook": "df_notifications.channels.JSONPostWebhookChannel",
        "chat": "df_notifications.channels.FirebaseChatChannel",
        "slack": "df_notifications.channels.SlackChannel",
        "sms": "df_notifications.channels.TwilioSMSChannel",
    },
    "REMINDERS_CHECK_PERIOD": 60,
    "SAVE_HISTORY_CONTENT": True,
}
