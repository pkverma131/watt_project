from rest_framework import serializers
from .models import Product, ImportantSpecification


class ProductSerializer(serializers.ModelSerializer):
    important_specification = serializers.SerializerMethodField()

    class Meta:
        model = Product
        exclude = ('model_number', 'thumbnail', 'created_by', 'updated_by', 'brand')

    def get_important_specification(self, obj):
        important_specification = obj.important_specifications.first()
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
