import requests
import tablib
from django.core.exceptions import ObjectDoesNotExist
from django.core.files.base import ContentFile
from import_export.admin import ImportExportMixin
from import_export.formats import base_formats
from import_export.resources import Resource
from import_export.widgets import ForeignKeyWidget, ManyToManyWidget, Widget


class EnumWidget(Widget):
    def __init__(self, enum_class):
        self.enum_class = enum_class

    def clean(self, value, row=None, *args, **kwargs):
        val = super().clean(value)
        if val:
            return getattr(self.enum_class, val.upper()).value

    def render(self, value, obj=None):
        if value:
            return dict(self.enum_class.choices).get(value)


class HashIdWidget(Widget):
    def render(self, value, obj=None):
        return str(value)


class HashIdForeignKeyWidget(ForeignKeyWidget):
    def render(self, value, obj=None):
        return str(super().render(value, obj=obj))


class ManyToManyChainWidget(ManyToManyWidget):
    def render(self, value, obj=None):
        ids = []
        for val in value.all():
            attrs = self.field.split("__")
            for attr in attrs:
                try:
                    val = getattr(val, attr, None)
                except (ValueError, ObjectDoesNotExist):
                    return None
                if value is None:
                    return None
            ids.append(val)
        return self.separator.join(ids)


class FileURLWidget(Widget):
    def render(self, value, obj=None):
        if value:
            return value.url


class RelatedMultiFieldsWidget(Widget):
    def __init__(
        self,
        model,
        field,
        related_field,
        many=False,
        recursive_field=None,
        separator=":",
    ):
        self.model = model
        self.related_field = related_field
        self.field = field
        self.many = many
        self.recursive_field = recursive_field
        self.separator = separator

    def render(self, value, obj=None):
        if obj.__class__ != self.model:
            obj = value
            value = getattr(value, self.field)

        if obj.pk and value:
            related_obj = (
                getattr(obj, self.related_field).first()
                if self.many
                else getattr(obj, self.related_field)
            )
            if related_obj:
                value_list = [getattr(related_obj, self.field), value]
                if self.recursive_field and getattr(related_obj, self.recursive_field):
                    rec_field_value = getattr(
                        getattr(related_obj, self.recursive_field), self.field
                    )
                    if rec_field_value:
                        value_list.insert(1, rec_field_value)
            else:
                value_list = [value]
            return self.separator.join(value_list)


class EnsureForeignKeyWidget(ForeignKeyWidget):
    def clean(self, value, row=None, *args, **kwargs):
        if value:
            return self.get_queryset(value, row, *args, **kwargs).get_or_create(
                **{self.field: value}
            )[0]
        else:
            return None


class SCSV(base_formats.CSV):
    def get_title(self):
        return "scsv"

    def create_dataset(self, in_stream, **kwargs):
        kwargs["delimiter"] = ";"
        kwargs["format"] = "csv"
        return tablib.import_set(in_stream, **kwargs)


class SCSVAdminMixin(ImportExportMixin):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.formats += [SCSV]

    def get_import_formats(self):
        return [f for f in self.formats if f().can_import()]


class ExternalImageResourceMixin(Resource):
    def __init__(self):
        super().__init__()
        self.dry_run = False

    def before_import(self, dataset, using_transactions, dry_run, **kwargs):
        self.dry_run = dry_run

    def before_import_row(self, row, row_number=None, **kwargs):
        for field_name in getattr(self.Meta, "external_image_fields", []):
            url = row.get(field_name, None)

            if url:
                if not self.dry_run:
                    content = requests.get(url).content
                    row[field_name] = ContentFile(
                        name=url.split("/")[-1], content=content
                    )
                else:
                    requests.options(url)
                    row[field_name] = url.split("/")[-1]
