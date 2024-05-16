from split_ac_data_loader import get_split_ac_links
from constants import API_BASE_URL, AC_API_URL, API_PAGE, AC_CATEGORIES
from utils import generate_filename, write_josn_to_file


PROJECT_BASE_LOCATION = '/home/ubuntu/devwork/digital-properties/acmandi/data_loader/'


if __name__=='__main__':
    for acc in AC_CATEGORIES:
        product_list = get_split_ac_links(f"{API_BASE_URL}{AC_API_URL.format(category=acc)}{API_PAGE}")
        filename = f"ac_category_{acc}.json"  # generate_filename(f"ac_category_{acc}")
        product_links_file_path = f"{PROJECT_BASE_LOCATION}links/{filename}"
        write_josn_to_file(product_list,product_links_file_path)
    #TODO: Manually get all category listing page API url
    #TODO: Scrap product details of each product
    #TODO: Dynamically get URLS of all the product categories