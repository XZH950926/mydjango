from django.db import models

# Create your models here.
from django.db import models

# Create your models here.
from datetime import datetime
from DjangoUeditor.models import UEditorField
# 分类表
class GoodsCategory(models.Model):
    """
    商品分类
    """
    CATEGORY_TYPE = (
        (1, "一级类目"),
        (2, "二级类目"),
        (3, "三级类目"),
    )

    name = models.CharField('类别名', default="", max_length=30, help_text="类别名")
    code = models.CharField("类别code", default="", max_length=30, help_text="类别code")
    desc = models.TextField("类别描述", default="", help_text="类别描述")
    # 目录树级别
    category_type = models.IntegerField("类目级别", choices=CATEGORY_TYPE, help_text="类目级别")
    # 设置models有一个指向自己的外键
    parent_category = models.ForeignKey("self", on_delete=models.CASCADE, null=True, blank=True, verbose_name="父类目级别",
                                        help_text="父目录",
                                        related_name="sub_cat")
    is_tab = models.BooleanField("是否导航", default=False, help_text="是否导航")
    add_time = models.DateTimeField("添加时间", default=datetime.now)

    class Meta:
        verbose_name = "商品类别"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


# 商品表
class Goods(models.Model):
    """
    商品
    """
    category = models.ForeignKey(GoodsCategory, on_delete=models.CASCADE, verbose_name="商品类目")
    goods_sn = models.CharField("商品唯一货号", max_length=50, default="")
    name = models.CharField("商品名", max_length=100, )
    click_num = models.IntegerField("点击数", default=0)
    sold_num = models.IntegerField("商品销售量", default=0)
    fav_num = models.IntegerField("收藏数", default=0)
    goods_num = models.IntegerField("库存数", default=0)
    market_price = models.FloatField("市场价格", default=0)
    shop_price = models.FloatField("本店价格", default=0)
    goods_brief = models.TextField("商品简短描述", max_length=500)
    # goods_desc = UEditorField(verbose_name=u"内容", imagePath="goods/images/", width=1000, height=300,
    #                           filePath="goods/files/", default='')
    goods_desc = UEditorField(verbose_name=u"内容", imagePath="goods/images/", width=1000, height=300,
                              filePath="goods/files/", default='')

    ship_free = models.BooleanField("是否承担运费", default=True)
    # 首页中展示的商品封面图
    goods_front_image = models.ImageField(upload_to="goods/images/", null=True, blank=True, verbose_name="封面图")
    # 首页中新品展示
    is_new = models.BooleanField("是否新品", default=False)
    # 商品详情页的热卖商品，自行设置
    is_hot = models.BooleanField("是否热销", default=False, help_text='是否热销')
    add_time = models.DateTimeField("添加时间", default=datetime.now)

    class Meta:
        verbose_name = '商品信息'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class IndexBanner(models.Model):
    goods=models.ForeignKey(Goods,on_delete=models.CASCADE,verbose_name='关联商品')
    index=models.IntegerField()
    image=models.ImageField(upload_to='banner',null=True, blank=True, verbose_name="首页轮播图")

    class Meta:
        verbose_name = '首页轮播图'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods.name

class goodsImage(models.Model):
    goods=models.ForeignKey(Goods,on_delete=models.CASCADE,verbose_name='商品',related_name='images')
    image = models.ImageField(upload_to='goods/banner/', null=True, blank=True, verbose_name="首页轮播图")

    class Meta:
        verbose_name = '商品轮播图'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods.name