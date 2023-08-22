import firebase_admin

from .base import env

FCM_DJANGO_SETTINGS = {
    "ONE_DEVICE_PER_USER": False,
    "DELETE_INACTIVE_DEVICES": True,
    "UPDATE_ON_DUPLICATE_REG_ID": True,
}
FIREBASE_PROJECT_ID = env.str("FIREBASE_PROJECT_ID")


FIREBASE_APP = firebase_admin.initialize_app()
# FIREBASE_FIRESTORE_CLIENT = client()
