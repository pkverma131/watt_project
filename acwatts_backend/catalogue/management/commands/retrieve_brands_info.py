import os
from django.core.management.base import BaseCommand
import json

class Command(BaseCommand):
    help = 'Capture brand names and addresses from products directory JSON files'

    def handle(self, *args, **options):
        products_directory = '/home/ubuntu/playground/watt_project/data_loader/products'  # Replace with the actual path to your products directory
        brand_data = []
        for filename in os.listdir(products_directory):
            if filename.endswith('.json'):
                filepath = os.path.join(products_directory, filename)

                with open(filepath, 'r') as file:
                    data = json.load(file)
                    brand_name = None
                    manufacturer_address = None
                    brand_support_number = None
                    brand_support_email = None
                    origin_country = None
                    brand_country = None

                    for spec in data.get('specifications', []):
                        if spec['specification_key'] == 'Brand':
                            brand_name = spec['specification_value']
                        if spec['specification_key'] == 'Manufacturer/Importer/Marketer Name & Address':
                            manufacturer_address = spec['specification_value']
                        if spec['specification_key'] == 'Brand Support Number':
                            brand_support_number = spec['specification_value']
                        if spec['specification_key'] == 'Brand Support Email':
                            brand_support_email = spec['specification_value']
                        if spec['specification_key'] == 'Country of Manufacture':
                            origin_country = spec['specification_value']
                        if spec['specification_key'] == 'Country of Brand Origin':
                            brand_country = spec['specification_value']

                    brand_info = {
                        'brand_name': brand_name,
                        'manufacturer_address': manufacturer_address,
                        'brand_support_number':brand_support_number,
                        'brand_support_email':brand_support_email,
                        'origin_country':origin_country,
                        'brand_country':brand_country
                    }

                    brand_data.append(brand_info)
        
        # Create a set to keep track of unique brand names
        unique_brands = set()

        # Create a list to store unique brand data
        unique_brand_data = []

        for item in brand_data:
            brand_name = item.get('brand_name')
            
            # Skip entries where brand_name is None or empty
            if not brand_name:
                continue

            # If the brand name is not in the set, add it to the set and append the item to the unique_brand_data list
            if brand_name not in unique_brands:
                unique_brands.add(brand_name)
                unique_brand_data.append(item)
        # Save the brand data to a JSON file
        with open('brand_data.json', 'w') as output_file:
            json.dump(unique_brand_data, output_file, indent=2)

        self.stdout.write(self.style.SUCCESS('Brand names and addresses captured and saved to brand_data.json'))
