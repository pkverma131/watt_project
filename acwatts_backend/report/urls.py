from django.urls import path
from .views import site_statistics_view
from .views import custom_403_view

handler403 = custom_403_view

urlpatterns = [
    path('site-statistics/', site_statistics_view, name='site-statistics'),
]
