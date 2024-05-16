from rest_framework import serializers
from .models import Product, ProductToProductHighlight, ImportantSpecification

class ProductSerializer(serializers.ModelSerializer):
    highlights = serializers.SerializerMethodField()

    class Meta:
        model = Product
        fields = '__all__'

    def get_highlights(self, obj):
        product_highlights = ProductToProductHighlight.objects.filter(product=obj)
        highlights = product_highlights.values_list('highlight__highlight', flat=True)
        return list(highlights)

class BillAmountSerializer(serializers.ModelSerializer):
    class Meta:
        model = ImportantSpecification
        fields = '__all__'
