from django.shortcuts import render
# Create your views here.
from rest_framework import mixins
from rest_framework import viewsets
from .models import UserFav,addCarModel
from rest_framework.generics import GenericAPIView
from .serializer import UserFavSerializer,UserFavDetailSerializer
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import SessionAuthentication,BasicAuthentication
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from .serializer import goodsCarDetailSerializer,goodsCarSerializer
from goods.models import Goods
from rest_framework import validators
class getUserFav(viewsets.ModelViewSet):
    queryset = UserFav.objects.all()
    def get_serializer_class(self):
        if self.action=='list':
            return UserFavDetailSerializer
        else:
            return UserFavSerializer

    def get_queryset(self):
        print(self.request.user)
        return UserFav.objects.filter(user=self.request.user)
    authentication_classes = [BasicAuthentication,JSONWebTokenAuthentication,]
    permission_classes =[IsAuthenticated,]
    lookup_field = 'goods_id'


class shoppingCarView(viewsets.ModelViewSet):
    permission_classes = [IsAuthenticated,]
    authentication_classes = [BasicAuthentication,JSONWebTokenAuthentication,]
    #重写serializer_class方法
    lookup_field = 'goods_id'
    def get_serializer_class(self):
        if self.action=="list":
            return goodsCarDetailSerializer
        return goodsCarSerializer
    #确认是本人的购物车
    def get_queryset(self):
        return addCarModel.objects.filter(user=self.request.user)

    def perform_create(self, serializer):
        goods_id=serializer.data["goods"]
        user=self.request.user
        #如果不加上first()就是Querylist类型
        shoppingCar=addCarModel.objects.filter(user=user,goods_id=goods_id).first()
        gs=Goods.objects.filter(id=goods_id).first()
        if gs.goods_num >= serializer.data["nums"]:
            gs.goods_num-=serializer.data["nums"]
            gs.save()
            if shoppingCar:
                shoppingCar.nums+=serializer.data["nums"]
                shoppingCar.save()
            else:
                addCarModel.objects.create(user=user,goods_id=goods_id,nums=serializer.data["nums"])

        else:
            raise validators.ValidationError("商品数量不足")
    def perform_update(self, serializer):
        shopCar=addCarModel.objects.filter(id=serializer.instance.pk).first()
        goods=serializer.instance.goods
        c=shopCar.nums-serializer.initial_data['nums']
        shopCar.nums = serializer.initial_data['nums']
        goods.goods_num += c
        if goods.goods_num<=0:
            raise validators.ValidationError("商品不足")
        shopCar.save()
        goods.save()
        # 更新购物车中数量

    def perform_destroy(self, instance):
        shopCar=addCarModel.objects.get(id=instance.pk)
        goods=instance.goods
        goods.goods_num+=shopCar.nums
        shopCar.delete()
        goods.save()



