from urllib.parse import urljoin

from django.conf import settings
from django.contrib.staticfiles.storage import ManifestStaticFilesStorage
from storages.backends.gcloud import GoogleCloudStorage


class MediaRootGoogleCloudStorage(GoogleCloudStorage):
    file_overwrite = False
    querystring_auth = False

    def url(self, name):
        return urljoin(settings.MEDIA_URL, name)


class NoSourceMapsStorage(ManifestStaticFilesStorage):
    patterns = (
        (
            "*.css",
            (
                "(?P<matched>url\\(['\"]{0,1}\\s*(?P<url>.*?)[\"']{0,1}\\))",
                (
                    "(?P<matched>@import\\s*[\"']\\s*(?P<url>.*?)[\"'])",
                    '@import url("%(url)s")',
                ),
            ),
        ),
    )
