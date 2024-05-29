from rest_framework import serializers
from .models import Product, ProductToProductHighlight, ImportantSpecification


class ProductSerializer(serializers.ModelSerializer):
    highlights = serializers.SerializerMethodField()
    important_specification = serializers.SerializerMethodField()

    class Meta:
        model = Product
        exclude = ('created_by', 'updated_by', 'created_at','updated_at')
    
    def get_highlights(self, obj):
        product_highlights = ProductToProductHighlight.objects.filter(product=obj)
        highlights = product_highlights.values_list('highlight__highlight', flat=True)
        return list(highlights)

    def get_important_specification(self, obj):
        important_specification = obj.important_specification.first()
        if important_specification:
            return {
                'wattage': important_specification.wattage,
                'coverage_area': important_specification.coverage_area,
                'energy_rating': important_specification.energy_rating,
                'default_bill_amount': important_specification.default_bill_amount,
            }
        else:
            return None

class BillAmountSerializer(serializers.ModelSerializer):
    class Meta:
        model = ImportantSpecification
        fields = '__all__'
