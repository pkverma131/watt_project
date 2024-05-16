import re
from django.core.management.base import BaseCommand
from catalogue.models import Product, ImportantSpecification

def calculate_hourly_energy_consumption(wattage, energy_rating):

    return (wattage/energy_rating)/1000

def btu_to_watts(value_str):
    try:
        # Split the string into numeric value and unit parts
        value_parts = value_str.split()
        numeric_value = float(value_parts[0])
        unit = value_parts[1].lower()  # Convert the unit to lowercase for case-insensitive comparison

        # Check if the unit is BTU/H
        if unit == 'btu/h':
            # Convert BTU/H to Watts using the conversion factor
            watts_value = numeric_value * 0.29307107
            return watts_value
        else:
            # If the unit is already in Watts or not recognized, return the numeric value as is
            return numeric_value
    except:
        # If there's an error in parsing, return None
        return None

def convert_iseer_to_star_rating(iseer_string):
    iseer_value = float(re.search(r'\d+\.\d+', iseer_string).group())
    print(iseer_value)
    if iseer_value >= 5.8:
        return 5
    elif 4.5 <= iseer_value < 5.8:
        return 4
    elif 3.3 <= iseer_value < 4.5:
        return 3
    else:
        return iseer_value

def get_rating(value):
    extracted_value = 0
    # Regular expression to extract the float value
    pattern = r'(\d+(\.\d+)?)'
    # Find the float value using regular expression
    match = re.search(pattern, value)
    if match:
        extracted_value = float(match.group())
        print(extracted_value)
    else:
        print("No float value found.")
    return extracted_value

def get_watts(value):
    watts = 0
    # Regular expression to extract the numeric value
    pattern = r'(\d+(\.\d+)?)'

    # Find the numeric value using regular expression
    match = re.search(pattern, value)

    if match:
        extracted_value = float(match.group())
        print(extracted_value)
    else:
        print("No numeric value found.")
    return watts

def w_to_watts(value):
    extracted_value = 0

    pattern = r'(\d+(\.\d+)?)W?'

    # Find the numeric value using regular expression
    match = re.search(pattern, value)

    if match:
        extracted_value = float(match.group(1))
        print(extracted_value)
    return extracted_value
class Command(BaseCommand):
    help = 'Calculate and insert default_bill_amount for ImportantSpecification'

    def handle(self, *args, **options):
        # Retrieve all products
        products = Product.objects.all()

        # Define default values for daily usage and operating temperature range
        default_daily_usage_hours = 8
        default_tariff_rate = 8
        # default_operating_temperature_min = 20
        # default_operating_temperature_max = 25
        number_of_days = 30

        # Calculate and insert default_bill_amount for each product
        for product in products:
            # Inside the calculate_default_bill_amount method
            wattage_spec = product.producttospecification_set.filter(specification__label='Cooling Capacity').first()
            energy_rating_spec = product.producttospecification_set.filter(specification__label='Indian Seasonal Energy Efficiency Ratio (ISEER)').first()
            coverage_area_spec = product.producttospecification_set.filter(specification__label='Approximate Coverage Area(Sq.Ft)').first()

            if wattage_spec and energy_rating_spec and coverage_area_spec:
                if 'Watts' in wattage_spec.specification.value:
                    wattage_match = re.search(r'(\d+)\s*(?:Watts)?', wattage_spec.specification.value)
                    if wattage_match:
                        wattage = int(wattage_match.group(1))
                elif 'Watt' in wattage_spec.specification.value:
                    wattage = int(get_watts(wattage_spec.specification.value))
                elif 'BTU'in wattage_spec.specification.value:
                    wattage = int(btu_to_watts(wattage_spec.specification.value))
                elif 'W' in wattage_spec.specification.value:
                    wattage = int(w_to_watts(wattage_spec.specification.value))
                else:
                    wattage = int(wattage_spec.specification.value)
                energy_rating = energy_rating_spec.specification.value
                if 'ISEER' in energy_rating:
                    energy_rating = float(convert_iseer_to_star_rating(energy_rating))
                elif 'Wh/Wh' in energy_rating or 'W/W' in energy_rating:
                    energy_rating = float(get_rating(energy_rating))
                else:
                    energy_rating = float(energy_rating)
                if 'Sq.' in coverage_area_spec.specification.value:
                    coverage_area_match = re.search(r'(\d+)', coverage_area_spec.specification.value)
                    if coverage_area_match:
                        coverage_area = int(coverage_area_match.group(1))
                else:
                    coverage_area = int(coverage_area_spec.specification.value)
            # Calculate default_bill_amount based on provided specifications
            hourly_energy_consumption = calculate_hourly_energy_consumption(wattage,energy_rating)
            daily_energy_consumption = hourly_energy_consumption * default_daily_usage_hours
            monthly_units = daily_energy_consumption * number_of_days
            default_bill_amount = monthly_units * default_tariff_rate  # Presumed tariff rate of 8 rupees

            # Insert the calculated default_bill_amount into the ImportantSpecification model
            important_spec = ImportantSpecification.objects.create(
                product=product,
                wattage=wattage,
                coverage_area=coverage_area,
                energy_rating=energy_rating,
                default_bill_amount=default_bill_amount,
            )

            self.stdout.write(self.style.SUCCESS(f'Successfully inserted for product {product.title}: {default_bill_amount}'))
