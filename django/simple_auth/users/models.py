from typing import List

from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    phone_number = models.CharField(max_length=32, unique=True, null=True, blank=True)
    invited_by = models.ForeignKey(
        "self", on_delete=models.SET_NULL, null=True, blank=True
    )
    is_2fa_enabled = models.BooleanField(default=False)
