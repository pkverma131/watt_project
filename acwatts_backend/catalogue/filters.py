import django_filters
from .models import Product, ImportantSpecification

class ProductFilter(django_filters.FilterSet):
    min_default_bill_amount = django_filters.NumberFilter(field_name='important_specification__default_bill_amount', lookup_expr='gte')
    max_default_bill_amount = django_filters.NumberFilter(field_name='important_specification__default_bill_amount', lookup_expr='lte')
    min_coverage_area = django_filters.NumberFilter(field_name='important_specification__coverage_area', lookup_expr='gte')
    max_coverage_area = django_filters.NumberFilter(field_name='important_specification__coverage_area', lookup_expr='lte')

    air_conditioner_type = django_filters.CharFilter(field_name='producttospecification__specification__value', lookup_expr='icontains', method='filter_by_specification_label')
    air_conditioner_capacity = django_filters.CharFilter(field_name='producttospecification__specification__value', lookup_expr='icontains', method='filter_by_specification_label')
    brand = django_filters.CharFilter(field_name='producttospecification__specification__value', lookup_expr='icontains', method='filter_by_specification_label')


    class Meta:
        model = Product
        fields = []
    

    def filter_by_specification_label(self, queryset, name, value):
        if name == 'air_conditioner_type':
            label = 'Air Conditioner Type'
        elif name == 'air_conditioner_capacity':
            label = 'Air Conditioner Capacity'
        elif name == 'brand':
            label = 'Brand'
        else:
            return queryset
        
        return queryset.filter(
            producttospecification__specification__label=label,
            producttospecification__specification__value__icontains=value
        )