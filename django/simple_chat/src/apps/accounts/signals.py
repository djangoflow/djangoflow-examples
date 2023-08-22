from django.db.models.signals import post_save
from django.dispatch import receiver

from .models import User


@receiver(post_save, sender=User, weak=False)
def user_post_save(sender, instance, created, **kwargs):
    if created:
        # create some other models, like UserProfile
        pass
