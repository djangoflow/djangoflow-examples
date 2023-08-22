from rest_framework.viewsets import GenericViewSet


class PostFilterViewSetMixin(GenericViewSet):
    def filter_queryset(self, queryset):
        return self.post_filter_queryset(super().filter_queryset(queryset))

    def post_filter(self, queryset):
        return queryset
