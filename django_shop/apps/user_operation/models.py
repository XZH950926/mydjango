from django.db import models
from django.contrib.auth import get_user_model
User=get_user_model()
from goods.models import Goods
from datetime import datetime
# Create your models here.
class UserFav(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE,verbose_name="收藏用户")
    goods=models.ForeignKey(Goods,on_delete=models.CASCADE,verbose_name="收藏商品")
    add_time=models.DateTimeField(default=datetime.now)
    class Meta:
        verbose_name = "用户信息"  # 在admin中展示
        verbose_name_plural = verbose_name
        unique_together=('user','goods')
    def __str__(self):
        return self.user.name

class addCarModel(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE,verbose_name='用户')
    goods=models.ForeignKey(Goods,on_delete=models.CASCADE,verbose_name='商品')
    nums=models.IntegerField()
    add_time=models.DateTimeField(default=datetime.now)
    class Meta:
        verbose_name = "购物车"  # 在admin中展示
        verbose_name_plural = verbose_name
        unique_together=('user','goods')
    def __str__(self):
        return self.goods.name
    