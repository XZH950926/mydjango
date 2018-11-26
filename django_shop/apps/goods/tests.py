from django.test import TestCase

# Create your tests here.
import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "django_shop.settings")
import django
django.setup()
from django.contrib.auth.hashers import make_password,check_password
r=make_password("1234",None,"pbkdf2_sha256")
print(r)
print(check_password("1234",r))