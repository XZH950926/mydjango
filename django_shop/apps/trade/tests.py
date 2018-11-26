from django.test import TestCase

# Create your tests here.
def aa(a,b):
    return a+b
c1=aa(1.5,1.6)
print(c1)
c2=aa(1,2)
print(c2)


def bb(*args):
    totle=0
    for item in args:
        totle=totle+item
    return totle
