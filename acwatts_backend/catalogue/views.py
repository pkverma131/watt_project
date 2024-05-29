from rest_framework import viewsets
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.pagination import PageNumberPagination
from .filters import ProductFilter
from django.db import models
from .models import Brand, Product, ImportantSpecification
from .serializers import ProductSerializer, BillAmountSerializer, BrandSerializer

class BrandViewSet(viewsets.ModelViewSet):
    queryset = Brand.objects.all()
    serializer_class = BrandSerializer
    pagination_class = PageNumberPagination
    pagination_class.page_size = 10  # Set the page size to 10 items per page


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.prefetch_related('producttoproducthighlight_set__highlight').all()
    serializer_class = ProductSerializer
    pagination_class = PageNumberPagination
    pagination_class.page_size = 10  # Set the page size to 10 items per page

    # Override the get_queryset method to apply the filters
    def get_queryset(self):
        queryset = super().get_queryset()
        filter = ProductFilter(self.request.GET, queryset=queryset)
        return filter.qs



class ProductSearchAPIView(APIView):
    def get(self, request):
        # Retrieve the query parameter from the URL (e.g., /search/?query=mysearchquery)
        query = request.GET.get('query', '')
        
        # Query the products based on the title, brand, and model_number fields
        products = Product.objects.filter(
            models.Q(title__icontains=query) |
            models.Q(brand__name__icontains=query) |
            models.Q(model_number__icontains=query)
        )

        # Build the list of dictionaries containing id and title
        search_results = [
            {
                'id': product.id,
                'title': f"{product.title} {product.brand.name}-{product.model_number}"
            }
            for product in products
        ]

        return Response(search_results)


class BillAmountAPIView(APIView):
    def get(self, request, product_id):
        try:
            product = Product.objects.get(id=product_id)
            important_spec = ImportantSpecification.objects.get(product=product)
            serializer = BillAmountSerializer(important_spec)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except Product.DoesNotExist:
            return Response({"error": "Product not found."}, status=status.HTTP_404_NOT_FOUND)
        except ImportantSpecification.DoesNotExist:
            return Response({"error": "Important specifications not found."}, status=status.HTTP_404_NOT_FOUND)