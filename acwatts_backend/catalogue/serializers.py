from rest_framework import serializers
from .models import Product, ImportantSpecification

class ImportantSpecificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = ImportantSpecification
        fields = ('wattage', 'coverage_area', 'energy_rating', 'default_bill_amount')

class ProductSerializer(serializers.ModelSerializer):
    important_specification = ImportantSpecificationSerializer()

    class Meta:
        model = Product
        exclude = ('highlights', 'model_number', 'thumbnail', 'created_by', 'updated_by', 'brand')

class BillAmountSerializer(serializers.ModelSerializer):
    class Meta:
        model = ImportantSpecification
        fields = '__all__'
