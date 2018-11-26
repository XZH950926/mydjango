from django.contrib import admin
from .models import Goods,GoodsCategory,IndexBanner,goodsImage
# Register your models here.
import xadmin
class GoodsAdmin(object):
#显示的列
	list_display = ["name", "click_num", "sold_num", "fav_num", "goods_num", "market_price",
	                    "shop_price", "goods_brief", "goods_desc", "is_new", "is_hot", "add_time"]
	# 可以搜索的字段
	style_fields = {"goods_desc": "ueditor"}
	search_fields = ['name', ]
	#列表页可以直接编辑的
	list_editable = ["is_hot",]


class BannerAdmin(object):
	list_display=['goods','index','image']

class goodsImageAdmin(object):
	list_display=['goods','image']

xadmin.site.register(Goods,GoodsAdmin)
xadmin.site.register(IndexBanner,BannerAdmin)
xadmin.site.register(goodsImage,goodsImageAdmin)