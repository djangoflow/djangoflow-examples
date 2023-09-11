from django.contrib import admin
from django.contrib.auth import admin as auth_admin
from django.contrib.auth.admin import UserAdmin as DefaultUserAdmin
from .models import User


@admin.register(User)
class UserAdmin(auth_admin.UserAdmin):
    list_display = DefaultUserAdmin.list_display + ('phone_number', 'is_2fa_enabled', 'invited_by')
    search_fields = ('email', 'phone_number', 'first_name', 'last_name', 'username')
    fieldsets = DefaultUserAdmin.fieldsets + (
        ('Extra Fields', {'fields': ('phone_number', 'invited_by', 'is_2fa_enabled')}),
    )
    ordering = ('email',)