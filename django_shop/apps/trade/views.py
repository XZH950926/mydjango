from django.shortcuts import render
from rest_framework import viewsets
# Create your views here.
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import BasicAuthentication,SessionAuthentication
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from .serializer import addressSerializer
from .models import addressModel,OrderInfo,OrderGoods
from user_operation.models import addCarModel
from rest_framework import mixins
from .serializer import orderDetailSerializer,OrderGoodsSerializers,orderSerializer
class addressView(viewsets.ModelViewSet):
    permission_classes = (IsAuthenticated,)  # 必须是自己
    authentication_classes = [BasicAuthentication, JSONWebTokenAuthentication]
    serializer_class = addressSerializer
    def get_queryset(self):
        return addressModel.objects.filter(user=self.request.user)
class OrderInfoView(viewsets.GenericViewSet,mixins.RetrieveModelMixin,mixins.ListModelMixin,
                    mixins.DestroyModelMixin,mixins.CreateModelMixin):
    permission_classes = (IsAuthenticated,)  # 必须是自己
    authentication_classes = [BasicAuthentication, JSONWebTokenAuthentication]
    # serializer_class = orderDetailSerializer
    def get_serializer_class(self):
        if self.action=="retrieve":
            return orderDetailSerializer
        return orderSerializer
    def get_queryset(self):
        return OrderInfo.objects.filter(user=self.request.user)
    def perform_create(self, serializer): # 新建订单
        # 保存订单信息, 清空购物车
        order = serializer.save() # 保存订单
        # 清空购物车 ,  在订单详情中保存购物车中数据
        shop_carts = addCarModel.objects.filter(user=self.request.user).all()
        for shop_cart in shop_carts: # 循环购物车中没意见商品
            order_goods = OrderGoods() # 创建一个订单详情
            order_goods.goods = shop_cart.goods # 商品
            order_goods.goods_num = shop_cart.nums # 数量
            order_goods.order = order # 给订单赋值
            order_goods.save() # 保存订单详情
            # 清空购物车
            shop_cart.delete()
        return order


'''
return_url 1.修改订单的状态(根据返回值,已完成,未完成,取消..)
           2.返回一个页面, 
'''


from rest_framework.views import APIView
from .aliPay import AliPay
from datetime import datetime
from django.shortcuts import HttpResponseRedirect
from rest_framework.response import Response
class AlipayView(APIView):

    def get(self, request):
        processed_dict = {}
        #取出post里面的数据
        for key, value in request.GET.items():
            processed_dict[key] = value
        #把signpop掉，文档有说明
        sign = processed_dict.pop("sign", None)

        #生成一个Alipay对象
        alipay = AliPay(
            appid="2016092000553335",
            app_notify_url="http://39.105.54.29:8000/alipay/return/",
            app_private_key_path='apps/trade/keys/private_key.txt',
            alipay_public_key_path='apps/trade/keys/alipay.txt',  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            debug=True,  # 默认False,
            return_url="http://39.105.54.29:8000/alipay/return/"
        )

        #进行验证
        verify_re = alipay.verify(processed_dict, sign)

        # 如果验签成功
        if verify_re is True:
            #商户网站唯一订单号
            order_sn = processed_dict.get('out_trade_no', None)
            #支付宝系统交易流水号
            trade_no = processed_dict.get('trade_no', None)
            #交易状态
            trade_status = processed_dict.get('trade_status', None)
            # 查询数据库中订单记录(根据订单号查询订单)
            existed_orders = OrderInfo.objects.filter(order_sn=order_sn)

            for existed_order in existed_orders:
                # 订单商品项
                order_goods = existed_order.goods.all() # 订单的详情
                # 商品销量增加订单中数值
                for order_good in order_goods:
                    goods = order_good.goods  # 获取到所有的商品
                    goods.sold_num += order_good.goods_num # 销量进行累加
                    goods.save() # 保存到数据库中

                # 更新订单状态
                existed_order.pay_status = trade_status # 修改订单的状态
                existed_order.trade_no = trade_no # 支付宝的流水号
                existed_order.pay_time = datetime.now() # 支付时间
                existed_order.save() # 更新订单信息
            #需要返回一个'success'给支付宝，如果不返回，支付宝会一直发送订单支付成功的消息
            return HttpResponseRedirect('http://39.105.54.29:8000/myindex/')
        else:
            return Response('支付失败,sign不成功')


    def post(self, request):
        """
        处理支付宝的notify_url (必须是公网ip才行)
        """
        #存放post里面所有的数据
        processed_dict = {}
        #取出post里面的数据
        for key, value in request.POST.items():
            processed_dict[key] = value
        #把signpop掉，文档有说明
        sign = processed_dict.pop("sign", None)

        #生成一个Alipay对象
        alipay = AliPay(
            appid="2016092000553335",
            app_notify_url="http://39.105.54.29:8000/alipay/return/",
            app_private_key_path='apps/trade/keys/private_key.txt',
            alipay_public_key_path='apps/trade/keys/alipay.txt',  # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            debug=True,  # 默认False,
            return_url="http://39.105.54.29:8000/alipay/return/"
        )

        #进行验证
        verify_re = alipay.verify(processed_dict, sign)

        # 如果验签成功
        if verify_re is True:
            #商户网站唯一订单号
            order_sn = processed_dict.get('out_trade_no', None)
            #支付宝系统交易流水号
            trade_no = processed_dict.get('trade_no', None)
            #交易状态
            trade_status = processed_dict.get('trade_status', None)

            # 查询数据库中订单记录
            existed_orders = OrderInfo.objects.filter(order_sn=order_sn)
            for existed_order in existed_orders:
                # 订单商品项
                order_goods = existed_order.goods.all()
                # 商品销量增加订单中数值
                for order_good in order_goods:
                    goods = order_good.goods
                    goods.sold_num += order_good.goods_num
                    goods.save()

                # 更新订单状态
                existed_order.pay_status = trade_status
                existed_order.trade_no = trade_no
                existed_order.pay_time = datetime.now()
                existed_order.save()
            #需要返回一个'success'给支付宝，如果不返回，支付宝会一直发送订单支付成功的消息
            return Response("success")