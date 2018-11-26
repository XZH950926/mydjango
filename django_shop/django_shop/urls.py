"""django_shop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
# from django.contrib import admin
from django.urls import path,include,re_path
from django.views.static import serve
from django_shop.settings import MEDIA_ROOT
import xadmin
from rest_framework_jwt.views import obtain_jwt_token
from django.urls import path,include
from rest_framework.routers import DefaultRouter
from trade.views import addressView,OrderInfoView
router = DefaultRouter()
router.register(r'orders',OrderInfoView,basename='user_order')
router.register(r'address',addressView,basename='user_address')
from goods.views import getCateGory,getBanner
from goods.views import getProduct
from django.urls import path,re_path,include
from user_operation.views import getUserFav,shoppingCarView

router.register(r'goods',getProduct)
router.register(r'category',getCateGory)
router.register(r'banner',getBanner)
router.register(r'userfavs',getUserFav,basename='userfavs')
router.register(r'shopcarts',shoppingCarView,basename='shopCar')
from django.shortcuts import render

def returnIndex(request):
    return render(request,"index.html")

urlpatterns = [
    path('index/',returnIndex),
    path('', include(router.urls)),
    path('ueditor/',include('DjangoUeditor.urls' )),
    path('xadmin/',xadmin.site.urls),
    # path('goods/',include('goods.urls')),
    re_path(r'^api-auth/', include('rest_framework.urls')),
    path('media/<path:path>/',serve,{'document_root':MEDIA_ROOT}),
    path('jwt-auth/', obtain_jwt_token),
    path('login/',obtain_jwt_token),
    path('', include('social_django.urls', namespace='social'))

    # path('',include('user_operation.urls')),
    # path('',include('trade.urls')),

]
