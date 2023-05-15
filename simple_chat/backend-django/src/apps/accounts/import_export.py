from core.import_export import ExternalImageResourceMixin, FileURLWidget
from import_export import fields, resources

from .models import User


class UserResource(ExternalImageResourceMixin, resources.ModelResource):
    avatar = fields.Field(
        column_name="avatar",
        attribute="avatar",
        widget=FileURLWidget(),
    )

    class Meta:
        model = User
        skip_unchanged = True
        import_id_fields = ("email",)
        export_order = import_id_fields + (
            "first_name",
            "last_name",
            "avatar",
        )
        fields = export_order + ("phone_number",)
        external_image_fields = ("avatar",)
