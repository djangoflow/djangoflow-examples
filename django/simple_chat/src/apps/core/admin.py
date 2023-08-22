from django.contrib import admin


class IsActiveAdmin(admin.ModelAdmin):
    def activate(self, request, qs):
        qs.update(is_active=True)

    def deactivate(self, request, qs):
        qs.update(is_active=False)

    actions = [activate, deactivate]
