from django.core.management.base import BaseCommand, CommandError
from .fetch_product_service import fetch_products


API_URL = "https://api.croma.com/product/allchannels/v1/category/867?" \
          "currentPage={page}&query=:relevance:excludeOOSFlag&fields=FULL&sort=relevance"


class Command(BaseCommand):
    help = 'Fetch product urls and save to json file'

    def add_arguments(self, parser):
        parser.add_argument('sites', nargs='+', type=str)

    def handle(self, *args, **options):
        for site in options['sites']:
            try:
                print(site)
                fetch_products(API_URL)
            except:
                raise CommandError('API URL "%s" does not exist' % API_URL)

            self.stdout.write(self.style.SUCCESS('Successfully closed poll "%s"' % site))
