from django_filters import rest_framework as filters
from django_filters.constants import EMPTY_VALUES


class DisplayChoiceCSVFilter(filters.BaseCSVFilter):
    def __init__(self, choices=None, **kwargs):
        self._reverse_choices = {v: k for k, v in choices}
        super().__init__(**kwargs)

    def filter(self, qs, value):
        if value in EMPTY_VALUES:
            return qs

        return super().filter(qs, [self._reverse_choices[v] for v in value])


class EnumLabelCSVFilter(filters.BaseCSVFilter):
    _values = {}

    def __init__(self, *args, **kwargs):
        self._values = {e.label: e.value for e in kwargs.pop("enum")}
        super().__init__(*args, **kwargs)

    def filter(self, qs, value):
        if value in EMPTY_VALUES:
            return qs
        return super().filter(qs, [self._values[e] for e in value])
