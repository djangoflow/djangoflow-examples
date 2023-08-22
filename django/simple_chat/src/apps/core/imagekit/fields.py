from imagekit.models import ProcessedImageField
from pilkit.processors import ResizeToFill, Transpose


class ResizedImageField(ProcessedImageField):
    def __init__(self, *args, **kwargs):
        self.size_field = kwargs.pop("size_field", None)
        kwargs.setdefault("blank", True)
        kwargs.setdefault("null", True)
        super().__init__(
            *args,
            processors=[
                ResizeToFill(kwargs.pop("width"), kwargs.pop("height")),
                Transpose(Transpose.AUTO),
            ],
            format="JPEG",
            options={"quality": 60},
            **kwargs
        )

    def update_dimension_fields(self, instance, force=False, *args, **kwargs):
        super().update_dimension_fields(instance, force=force, *args, **kwargs)

        file = getattr(instance, self.attname)
        if file and force and self.size_field:
            setattr(instance, self.size_field, file.size)


class AvatarImageField(ResizedImageField):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, width=256, height=256, **kwargs)


class IconImageField(ResizedImageField):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, width=100, height=100, **kwargs)


class FullImageField(ResizedImageField):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, width=800, height=500, **kwargs)
