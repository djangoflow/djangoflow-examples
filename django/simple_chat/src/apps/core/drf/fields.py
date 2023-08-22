from django.utils.translation import gettext_lazy as _
from rest_framework import exceptions, serializers


class AbstractEnumChoiceFieldBase(serializers.ChoiceField):
    _reverse_choices = {}

    def to_representation(self, obj):
        return obj if obj == "" and self.allow_blank else self._choices[obj]

    def to_internal_value(self, data):
        if data is None or (data == "" and self.allow_blank):
            return data
        try:
            return self._reverse_choices[data]
        except KeyError:
            raise exceptions.ValidationError(_("{} is not a valid choice".format(data)))


class EnumChoiceField(AbstractEnumChoiceFieldBase):
    def __init__(self, enum, **kwargs):
        super().__init__(choices=enum.choices, **kwargs)
        self._reverse_choices = dict((e.name, e) for e in enum)


class EnumLabelChoiceField(AbstractEnumChoiceFieldBase):
    def __init__(self, enum, **kwargs):
        super().__init__(choices=enum.choices, **kwargs)
        self._reverse_choices = dict((e.label, e) for e in enum)
