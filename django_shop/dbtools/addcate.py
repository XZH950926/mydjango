# django 批量导入数据

# model    1. 数据库的配置
import os

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "django_shop.settings")# project_name 项目名称
import django
django.setup()

from dbtools.data.category_data import row_data
from goods.models import GoodsCategory
def addcategory():
    for item in row_data:
        g1=GoodsCategory.objects.create(name=item['name'],code=item['code'],category_type=1)
        for item2 in item['sub_categorys']:
            g2=GoodsCategory.objects.create(name=item2['name'],code=item2['code'],category_type=2,parent_category=g1)
            for item3 in item2['sub_categorys']:
                g3=GoodsCategory.objects.create(name=item3['name'],code=item3['code'],category_type=3,parent_category=g2)

addcategory()
