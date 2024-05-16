from django.urls import path
from .views import BlogListCreateView, BlogRetrieveUpdateDestroyView

urlpatterns = [
    path('posts/', BlogListCreateView.as_view(), name='blog-list-create'),
    path('posts/<int:pk>/', BlogRetrieveUpdateDestroyView.as_view(), name='blog-retrieve-update-destroy'),
]
