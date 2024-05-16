# products/management/commands/import_products.py

import os
import json
from django.core.management.base import BaseCommand
from catalogue.models import Product, Brand

class Command(BaseCommand):
    help = 'Import products from JSON files'

    def add_arguments(self, parser):
        parser.add_argument('directory', type=str, help='The directory containing JSON files')

    def handle(self, *args, **kwargs):
        directory = kwargs['directory']
        files = os.listdir(directory)
        product_count = 0
        for filename in files:
            file_path = os.path.join(directory, filename)
            with open(file_path, 'r') as file:
                data = json.load(file)

            product_title = data.get('product_tile')
            specifications = data.get('specifications', [])
            
            brand_name = None
            model_number = None

            # Find brand_name and model_number in specifications
            for spec in specifications:
                if spec.get('specification_key') == 'Brand':
                    brand_name = spec.get('specification_value')
                elif spec.get('specification_key') == 'Model Number':
                    model_number = spec.get('specification_value')

            if not brand_name or not model_number:
                continue
            product_count+=1
            print(product_count)
            print(model_number)
            # Check if the product already exists in the database
            existing_product = Product.objects.filter(title=product_title).first()
            print(f'existing_product:{existing_product}, {type(existing_product)}, {existing_product.model_number}')
            if existing_product:
                if existing_product.model_number is (None or '') and model_number:
                    existing_product.model_number = model_number
                    existing_product.save()
                    self.stdout.write(self.style.SUCCESS(f"Updated model_number for product '{product_title}'"))
                else:
                    self.stdout.write(self.style.WARNING(f"model_number for product with title '{product_title}' already exists. Skipping..."))
                continue
            self.stdout.write(self.style.SUCCESS(f"Successfully imported product '{product_title}'"))
