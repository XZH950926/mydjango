from rest_framework import serializers
from goods.models import Goods,GoodsCategory,IndexBanner,goodsImage
class Categoryserializer3(serializers.ModelSerializer):
    # id=serializers.IntegerField(read_only=True)
    # name=serializers.CharField(max_length=30)
    class Meta:
        model=GoodsCategory
        fields="__all__"
class Categoryserializer2(serializers.ModelSerializer):
    # id=serializers.IntegerField(read_only=True)
    # name=serializers.CharField(max_length=30)
    sub_cat = Categoryserializer3(many=True)
    class Meta:
        model=GoodsCategory
        fields="__all__"
#category本身就是个对象所以必须单独处理
class Categoryserializer(serializers.ModelSerializer):
    # id=serializers.IntegerField(read_only=True)
    # name=serializers.CharField(max_length=30)
    sub_cat = Categoryserializer2(many=True)
    class Meta:
        model=GoodsCategory
        fields="__all__"
#这样写的话如果字段太多就会很繁琐，所以用模型处理就会很方便
# class productSerializer(serializers.Serializer):
#     # 只能读不能修改
#     id = serializers.IntegerField(read_only=True)
#     name = serializers.CharField(required=True, allow_blank=True, max_length=100)
#     click_num = serializers.IntegerField(default=0)
#     goods_num = serializers.IntegerField(default=0)
#     goods_brief = serializers.CharField(max_length=500)
#     category = Categoryserializer() # 使用上面的那个进行序列化
#
#     # validated_data 表单中获取的数据
#     def create(self, validated_data):
#         """
#         当调用post请求, 创建新的时候执行这个
#         """
#         return Goods.objects.create(**validated_data)
#
#     def update(self, instance, validated_data):
#         """
#         更新的时候使用
#         """
#         instance.title = validated_data.get('title', instance.title)
#         instance.code = validated_data.get('code', instance.code)
#         instance.linenos = validated_data.get('linenos', instance.linenos)
#         instance.language = validated_data.get('language', instance.language)
#         instance.style = validated_data.get('style', instance.style)
#         instance.save()
#         return instance
class goodsImageSerializer(serializers.ModelSerializer):
    class Meta:
        model=goodsImage
        fields=('image',)

class productSerializer(serializers.ModelSerializer):
    category=Categoryserializer()
    images=goodsImageSerializer(many=True)
    class Meta:
        model = Goods
        fields='__all__'


class bannerSerializer(serializers.ModelSerializer):
    goods=productSerializer
    class Meta:
        model=IndexBanner
        fields='__all__'

