import os
import sys
from pathlib import Path

from django.core.wsgi import get_wsgi_application

ROOT_DIR = Path(__file__).resolve(strict=True).parent.parent.parent
sys.path.append(str(ROOT_DIR / "src"))
sys.path.append(str(ROOT_DIR / "src" / "apps"))
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings.production")
application = get_wsgi_application()
