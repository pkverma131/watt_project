import json
import requests
from constants import SITE_BASE_URL

def get_split_ac_links(api_url):
    # product_list = []
    product_links = []
    payload={}
    headers = {}
    page_count = 0
    while True:
        print('page number'+(str(page_count)))
        url = api_url.format(page=str(page_count))
        print(url)
        response = requests.request("GET", url, headers=headers, data=payload)
        result = json.loads(response.text)
        print(result)
        products = result['products']
        if len(products)>0:
            # product_list.extend(products)
            links = [SITE_BASE_URL+product['url'] for product in products ]
            product_links.extend(links)
            page_count+=1
        else:
            break
    return product_links
        
