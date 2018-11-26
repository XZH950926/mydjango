import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "django_shop.settings")# project_name 项目名称
import django
django.setup()
from user.models import User
from rest_framework.authtoken.models import Token

users=User.objects.all()
for user in users:
    Token.objects.get_or_create(user=user)
