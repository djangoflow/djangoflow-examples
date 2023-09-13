from django.contrib import admin
from django.contrib.auth import admin as auth_admin
from django.contrib.auth.admin import UserAdmin as DefaultUserAdmin
from .models import User


@admin.register(User)
class UserAdmin(auth_admin.UserAdmin):
    list_display = ("email", "first_name", "last_name", "is_staff", "phone_number", "is_2fa_enabled", "created_by")
    search_fields = ("email", "phone_number", "first_name", "last_name")
    fieldsets = None
    ordering = ("email",)