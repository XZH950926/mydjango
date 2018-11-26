from rest_framework import serializers
from .models import UserFav
from goods.models import Goods
from goods.serializer import productSerializer
from rest_framework.validators import UniqueTogetherValidator
from .models import addCarModel
class UserFavSerializer(serializers.ModelSerializer):
    user=serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    class Meta:
        model=UserFav
        validators=[UniqueTogetherValidator(
            queryset=UserFav.objects.all(),
            fields=('user','goods'),
            message='已经收藏'
        )]
        fields='__all__'


class UserFavDetailSerializer(serializers.ModelSerializer):
    goods=productSerializer()
    class Meta:
        model=UserFav
        fields=('id','goods')


class goodsCarSerializer(serializers.Serializer):
    user=serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    goods=serializers.PrimaryKeyRelatedField(many=False,queryset=Goods.objects.all())
    nums=serializers.IntegerField(min_value=1,required=True,
                                  error_messages ={
                                     "required":"数量是必填项",
                                      "min_value":"最小值为1"
                                  }
                                   )
class goodsCarDetailSerializer(serializers.ModelSerializer):
    goods=productSerializer()
    class Meta:
        model=addCarModel
        fields="__all__"