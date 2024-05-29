from django.urls import path, include
from rest_framework import routers
from .views import ProductViewSet,ProductSearchAPIView, BillAmountAPIView, BrandViewSet


router = routers.DefaultRouter()
router.register(r'products', ProductViewSet)
router.register(r'brands', BrandViewSet)


urlpatterns = [
    path('', include(router.urls)),
    path('search/', ProductSearchAPIView.as_view(), name='product-search'),
    path('api/bill_amount/<int:product_id>/', BillAmountAPIView.as_view(), name='bill_amount'),


]

