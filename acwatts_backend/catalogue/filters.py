import django_filters
from .models import Product, ImportantSpecification

class ProductFilter(django_filters.FilterSet):
    min_default_bill_amount = django_filters.NumberFilter(field_name='importantspecification__default_bill_amount', lookup_expr='gte')
    max_default_bill_amount = django_filters.NumberFilter(field_name='importantspecification__default_bill_amount', lookup_expr='lte')
    min_coverage_area = django_filters.NumberFilter(field_name='importantspecification__coverage_area', lookup_expr='gte')
    max_coverage_area = django_filters.NumberFilter(field_name='importantspecification__coverage_area', lookup_expr='lte')

    class Meta:
        model = Product
        fields = []
