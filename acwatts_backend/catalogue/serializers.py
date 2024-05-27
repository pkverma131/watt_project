from rest_framework import serializers
from .models import Product, ImportantSpecification

class ImportantSpecificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = ImportantSpecification
        fields = ('wattage', 'coverage_area', 'energy_rating', 'default_bill_amount')

class ProductSerializer(serializers.ModelSerializer):
    important_specification = serializers.SerializerMethodField()

    class Meta:
        model = Product
        exclude = ('model_number', 'thumbnail', 'created_by', 'updated_by', 'brand')
    
    def get_important_specification(self, obj):
        # Retrieve the related ImportantSpecification for the current Product instance
        try:
            important_specification = obj.important_specification
            # Serialize the ImportantSpecification data
            serializer = ImportantSpecificationSerializer(important_specification)
            return serializer.data
        except ImportantSpecification.DoesNotExist:
            return None

class BillAmountSerializer(serializers.ModelSerializer):
    class Meta:
        model = ImportantSpecification
        fields = '__all__'
