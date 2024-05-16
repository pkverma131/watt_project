from django.core.management.base import BaseCommand
from catalogue.models import Brand, Product, ProductHighlight, Specification,SpecificationType, ProductToProductHighlight, ProductToSpecification
import json
import os

class Command(BaseCommand):
    help = 'Insert data from JSON files into the tables.'

    def handle(self, *args, **options):
        json_files_directory = '/home/ubuntu/devwork/digital-properties/acmandi/data_loader/products'  # Update this with the directory containing your JSON files

        json_files = [f for f in os.listdir(json_files_directory) if f.endswith('.json')]

        for json_file in json_files:
            file_path = os.path.join(json_files_directory, json_file)

            with open(file_path, 'r') as file:
                data = json.load(file)

            product_tile = data.get('product_tile', '')
            overview_text = data.get('overview_text', '')
            mrp = data.get('mrp')
            product_price = data.get('product_price')
            key_features = data.get('key_features', [])
            specifications = data.get('specifications', [])
            brand_name = None
            for spec in data.get('specifications', []):
                        if spec['specification_key'] == 'Brand':
                            brand_name = spec['specification_value']
                            break
            try:
                 brand = Brand.objects.get(name=brand_name)
            except Exception as err:
                 print(str(err))
                 brand = Brand.objects.get(name='None')
            # Save Product instance
            
            # Check if a product with the same title already exists in the table
            existing_product = Product.objects.filter(title=product_tile).first()

            if existing_product:
                self.stdout.write(f"Product '{product_tile}' already exists. Skipping insertion.")
                continue

            product = Product.objects.create(
                brand=brand,
                title=product_tile,
                description=overview_text[0:499],
                # mrp=mrp,
                # product_price=product_price,
                thumbnail=None  # You can update this with the path to the thumbnail image if available
            )

            # Save ProductHighlight instances
            for feature in key_features:
                product_highlight = ProductHighlight.objects.create(
                    highlight=feature,
                    type='2'  # Assuming key_features are 'FEATURE' type, you can change this if needed
                )
                ProductToProductHighlight.objects.create(
                    product=product,
                    highlight=product_highlight
                )

            # Save Specification instances
            for spec in specifications:
                specification_key = spec.get('specification_key', '')
                specification_value = spec.get('specification_value', '')

                # Assuming you have a SpecificationType instance related to the specification
                specification_type = SpecificationType.objects.get(type='default')

                print(f'specification_value:{specification_value},{len(specification_value)}')

                specification = Specification.objects.create(
                    specification_type=specification_type,
                    label=specification_key,
                    value=specification_value[0:399]
                )

                ProductToSpecification.objects.create(
                    product=product,
                    specification=specification
                )

            print(f'Product inserted: {product.title}')
