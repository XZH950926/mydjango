from .models import addressModel
from rest_framework import serializers
from .models import OrderGoods,OrderInfo
from goods.serializer import productSerializer
class addressSerializer(serializers.ModelSerializer):
    user=serializers.HiddenField(
        default=serializers.CurrentUserDefault(),
    )
    class Meta:
        model=addressModel
        fields='__all__'


class orderSerializer(serializers.ModelSerializer):
    user=serializers.HiddenField(default=serializers.CurrentUserDefault())
    order_sn=serializers.CharField(read_only=True)
    trade_no=serializers.CharField(read_only=True)
    pay_type=serializers.CharField(read_only=True)
    pay_status=serializers.CharField(read_only=True)
    pay_time=serializers.DateTimeField(read_only=True)
    alipay_url=serializers.SerializerMethodField(read_only=True)
    def get_alipay_url(self,obj):
        from .aliPay import AliPay
        alipay = AliPay(
            # 沙箱里面的appid值
            appid="2016092000553335",
            # notify_url是异步的url
            app_notify_url="http://39.105.54.29/alipay/return/",
            # 我们自己商户的密钥的路径
            app_private_key_path="apps/trade/keys/private_key.txt",
            # 支付宝的公钥
            alipay_public_key_path="apps/trade/keys/alipay.txt",  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            # debug为true时使用沙箱的url。如果不是用正式环境的url
            debug=True,  # 默认False,
            return_url="http://39.105.54.29/alipay/return/"
        )

        #
        # for key, value in query.items():
        #     processed_query[key] = value[0]
        #
        # print (alipay.verify(processed_query, ali_sign))

        # 直接支付:生成请求的字符串。
        url = alipay.direct_pay(
            # 订单标题
            subject=obj.order_sn,
            # 我们商户自行生成的订单号
            out_trade_no=obj.order_sn,
            # 订单金额
            total_amount=obj.order_mount,
            # 成功付款后跳转到的页面，return_url同步的url
            return_url="http://4.93.198.159:8000/alipay/return/"
        )
        # #     # 将生成的请求字符串拿到我们的url中进行拼接
        re_url = "https://openapi.alipaydev.com/gateway.do?{data}".format(data=url)
        return re_url

    class Meta:
        model=OrderInfo
        fields="__all__"
    def generate_order_sn(self):
        from random import Random
        import time
        random_ins = Random()
        order_sn = "{time_str}{userid}{ranstr}".format(time_str=time.strftime("%Y%m%d%H%M%S"),
                                                       userid=self.context["request"].user.id,
                                                       ranstr=random_ins.randint(10, 99))
        return order_sn
    def create(self, validated_data):
        validated_data["order_sn"]=self.generate_order_sn()
        return OrderInfo.objects.create(**validated_data)

#查看全部的


class OrderGoodsSerializers(serializers.ModelSerializer):
    goods=productSerializer(many=False)
    class Meta:
        model = OrderGoods
        fields = '__all__'

class orderDetailSerializer(serializers.ModelSerializer):
    goods=OrderGoodsSerializers(many=True)
    class Meta:
        model = OrderGoods
        fields = '__all__'
