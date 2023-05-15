# -*- coding: utf-8 -*-
import logging

from accounts.models import User
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    # TODO: extend this example to export users with import_export and --format, --output arguments
    help = "List users"

    def handle(self, *args, **options):
        logging.info("Listing all users...")
        for user in User.objects.all():
            print(vars(user))
