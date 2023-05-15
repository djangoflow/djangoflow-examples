from django.contrib.auth import get_user_model
from hashid_field.rest import HashidSerializerCharField
from rest_framework import serializers

User = get_user_model()


class UserSerializer(serializers.ModelSerializer):
    id = HashidSerializerCharField(read_only=True)

    def validate(self, attrs):
        attrs["is_registering"] = False
        return super().validate(attrs)

    class Meta:
        model = User
        read_only_fields = (
            "id",
            "email",
            "avatar",
        )
        fields = read_only_fields + (
            "first_name",
            "last_name",
            "phone_number",
        )
