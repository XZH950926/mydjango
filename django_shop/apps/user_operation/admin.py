from django.contrib import admin
from .models import UserFav
# Register your models here.
import xadmin
class UserFavAdmin(object):
    list_display=['id','user','goods']

xadmin.site.register(UserFav,UserFavAdmin)