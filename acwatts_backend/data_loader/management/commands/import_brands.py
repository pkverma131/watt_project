# import_brands.py

import json
from django.core.management.base import BaseCommand
from catalogue.models import Brand

class Command(BaseCommand):
    help = 'Import brands from JSON file'

    def add_arguments(self, parser):
        parser.add_argument('json_file', type=str, help='Path to the JSON file containing brand data')

    def handle(self, *args, **kwargs):
        json_file_path = kwargs['json_file']

        # Read the JSON data from the file
        with open(json_file_path, 'r') as file:
            brands_data = json.load(file)

        # Iterate through the data and create Brand objects
        # for item in data:
        #     brand_name = item.get('brand_name')
        #     manufacturer_address = item.get('manufacturer_address')
        #     brand_support_number = item.get('brand_support_number')
        #     brand_support_email = item.get('brand_support_email')
        #     origin_country = item.get('origin_country')
        #     brand_country = item.get('brand_country')

        #     # Create a new Brand object and save it to the database
        #     brand = Brand(
        #         name=brand_name,
        #         address=manufacturer_address,
        #         support_contact=brand_support_number,
        #         support_email=brand_support_email,
        #         origin_country=brand_country,
        #         manufacture_country=origin_country
        #     )
        #     brand.save()

        # self.stdout.write(self.style.SUCCESS('Successfully imported brands.'))

        for brand_data in brands_data:
            brand_name = brand_data.get('brand_name')
            if brand_name:
                # Check if the brand name already exists in the database
                if Brand.objects.filter(name=brand_name).exists():
                    self.stdout.write(self.style.WARNING(f"Brand '{brand_name}' already exists. Skipping..."))
                else:
                    brand = Brand(
                        name=brand_name,
                        origin_country=brand_data.get('brand_country'),
                        manufacture_country=brand_data.get('origin_country'),
                        support_contact=brand_data.get('brand_support_number') if brand_data.get('brand_support_number') else 'None',
                        support_email=brand_data.get('brand_support_email') if brand_data.get('brand_support_email') else 'None',
                        address=brand_data.get('manufacturer_address') if brand_data.get('manufacturer_address') else 'None'
                    )
                    brand.save()
                    self.stdout.write(self.style.SUCCESS(f"Brand '{brand_name}' added successfully."))
            else:
                self.stdout.write(self.style.WARNING("Skipping entry without brand name."))

        self.stdout.write(self.style.SUCCESS("Brand import completed."))







