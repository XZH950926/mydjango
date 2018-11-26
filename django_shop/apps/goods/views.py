from django.shortcuts import render
from goods.serializer import productSerializer,bannerSerializer
from goods.models import GoodsCategory,Goods,IndexBanner
# Create your views here.
from django.http import JsonResponse
from django.views import View
from rest_framework.views import APIView
from rest_framework.response import Response
# class getProduct(View):
#     def get(self,request):
#         gs=Goods.objects.all()
#         lst=productSerializer(gs,many=True)
#         return JsonResponse(lst.data,safe=False)
#     def post(self,request):
#         pass
# 基于rest_framework的response
# class getProduct(APIView):
#     def get(self,request):
#         """
#            this is a product get
#            """
#         gs=Goods.objects.all()
#         lst=productSerializer(gs,many=True)
#         #这里面的response在view类的基础上再次封装的
#         return Response(lst.data)
# from rest_framework import mixins
# from rest_framework import generics
# class getProduct(mixins.ListModelMixin,generics.GenericAPIView):
#     queryset = Goods.objects.all()
#     serializer_class = productSerializer
#     def get(self,request,*args,**kwargs):
#         return self.list(self,request,*args,**kwargs)
#     def get_queryset(self):
#         key=self.request.query_params['name']
#         return Goods.objects.filter(name__contains=key)
#ListCreateAPIView
from rest_framework import generics
import django_filters
from django.db.models import Q
from django_filters import rest_framework as filters
from rest_framework import viewsets
from .models import GoodsCategory
from .serializer import Categoryserializer
from rest_framework.pagination import PageNumberPagination
from rest_framework import filters as resfilters
class ProductFilter(filters.FilterSet):
    pricemin=filters.NumberFilter(field_name="market_price", lookup_expr='gte')
    pricemax=filters.CharFilter(field_name='market_price',lookup_expr='lte')
    name=filters.CharFilter(field_name='name',lookup_expr='contains')
    top_category=filters.NumberFilter(field_name='category',method='categoryFilter')

    def categoryFilter(self,queryset,name,value):
        return queryset.filter(Q(category_id=value) | Q(category__parent_category_id=value) | Q
        (category__parent_category__parent_category_id=value))
    class Meta:
        model=Goods
        fields=['name','pricemin','pricemax','top_category']

class mypaginattion(PageNumberPagination):
    page_query_param='page'
    page_size = 12
    max_page_size = 100

class getProduct(viewsets.ReadOnlyModelViewSet):
    queryset = Goods.objects.all()
    serializer_class = productSerializer
    filterset_class = ProductFilter
    pagination_class = mypaginattion
    ordering_fields = ('sold_num', 'shop_price',)  # 进行排序
    search_fields = ('name',)  # 进行搜索
    filter_backends = (
    django_filters.rest_framework.DjangoFilterBackend, resfilters.SearchFilter, resfilters.OrderingFilter)

class getCateGory(viewsets.ReadOnlyModelViewSet):
    queryset = GoodsCategory.objects.filter(category_type=1).all()
    serializer_class = Categoryserializer

from rest_framework import mixins
from rest_framework import generics

class getBanner(mixins.ListModelMixin,viewsets.GenericViewSet):
    queryset = IndexBanner.objects.order_by('index').all()
    serializer_class = bannerSerializer





