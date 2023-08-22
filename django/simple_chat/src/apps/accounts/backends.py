from df_auth.backends import EmailOTPBackend as BaseEmailOTPBackend
from django.contrib.sites.models import Site


class EmailOTPBackend(BaseEmailOTPBackend):
    def send_otp(self, device, **kwargs):
        device.generate_challenge(
            {
                "username": device.email,
                "base_url": f"https://app.{Site.objects.get_current().domain}/#/login/",
            }
        )
