from core.admin import IsActiveAdmin
from django.apps import apps
from django.contrib import admin
from django.contrib.auth import admin as auth_admin
from django.contrib.auth.admin import GroupAdmin as BaseGroupAdmin
from django.utils.translation import gettext_lazy as _
from import_export.admin import ImportExportMixin

from .import_export import UserResource
from .models import Group, User


@admin.register(User)
class UserAdmin(ImportExportMixin, IsActiveAdmin, auth_admin.UserAdmin):
    resource_class = UserResource
    ordering = ("email",)
    list_display = [
        "email",
        "first_name",
        "last_name",
        "phone_number",
        "last_login",
        "is_staff",
        "is_superuser",
    ]
    search_fields = ["first_name", "last_name", "email", "phone_number"]
    list_display_links = ["email"]
    date_hierarchy = "last_login"

    fieldsets = (
        (None, {"fields": ("email", "password")}),
        (_("Personal info"), {"fields": ("first_name", "last_name")}),
        (
            _("Permissions"),
            {
                "fields": (
                    "is_active",
                    "is_staff",
                    "is_superuser",
                    "groups",
                    "user_permissions",
                ),
            },
        ),
        (_("Important dates"), {"fields": ("last_login", "date_joined")}),
    )
    add_fieldsets = (
        (
            None,
            {
                "classes": ("wide",),
                "fields": ("email", "password1", "password2"),
            },
        ),
    )
    ordering = ("email",)
    search_fields = ("email", "phone_number")


admin.site.unregister(apps.get_model("auth", "Group"))


@admin.register(Group)
class GroupAdmin(BaseGroupAdmin):
    pass
