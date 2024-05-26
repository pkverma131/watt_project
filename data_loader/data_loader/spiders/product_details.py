from pathlib import Path
import scrapy
import json
import time
import os
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

PROJECT_BASE_LOCATION = '/home/ubuntu/playground/watt_project/data_loader/'

def save_json_file(filename, json_data):
    file_path = f"{PROJECT_BASE_LOCATION}products/{filename}"
    os.makedirs(os.path.dirname(file_path), exist_ok=True)
    with open(file_path, "w") as outfile:
        outfile.write(json_data)

def get_product_urls():
    links_path = f"{PROJECT_BASE_LOCATION}links/"
    file_names = os.listdir(links_path)
    product_url_list = []
    for filename in file_names:
        file_name = f"{links_path}{filename}"
        with open(file_name) as file_obj:
            product_urls = json.load(file_obj)
            product_url_list.extend(product_urls)
    return product_url_list

class ProductDetailsSpider(scrapy.Spider):
    name = "product_details"

    def __init__(self, *args, **kwargs):
        super(ProductDetailsSpider, self).__init__(*args, **kwargs)
        chrome_options = Options()
        chrome_options.add_argument('--headless')
        chrome_options.add_argument('--no-sandbox')
        chrome_options.add_argument('--disable-dev-shm-usage')
        self.driver = webdriver.Chrome(ChromeDriverManager().install(), options=chrome_options)

    def start_requests(self):
        urls = get_product_urls()
        counter = 0
        for url in urls:
            counter += 1
            yield scrapy.Request(url=url, callback=self.parse)
            print(counter)
            if counter > 9:
                break

    def parse(self, response):
        self.driver.get(response.url)
        
        # Wait for the product title to be present
        product_title = WebDriverWait(self.driver, 10).until(
            EC.presence_of_element_located((By.XPATH, '//h1[@class="pd-title pd-title-normal"]'))
        ).text.strip()

        overview_div = response.xpath('//div[@id="overview_inner_container"]')
        paragraphs = overview_div.xpath('.//p//text()').extract()
        overview_text = "\n".join(paragraphs).strip() if paragraphs else ""

        # Extract specifications
        specifications = []
        spec_sections = response.xpath('//ul[@class="cp-specification-info"]/li/ul[@class="cp-specification-spec-info"]')
        for section in spec_sections:
            spec_key = section.xpath('.//li[@class="cp-specification-spec-title"]/h4/text()').get()
            spec_value = section.xpath('.//li[@class="cp-specification-spec-details"]/text()').get()

            spec_value = section.xpath('.//li[@class="cp-specification-spec-details"]//text()').get()
            if not spec_value:
                spec_value = section.xpath('.//li[@class="cp-specification-spec-details"]/a/text()').get()
            
            print(spec_key)
            print(spec_value)
            if spec_key and spec_value:
                specifications.append({
                    'specification_key': spec_key.strip(),
                    'specification_value': spec_value.strip()
                })

        # Extract price and MRP
        mrp = response.xpath('//span[@class="old-price"]/span[@class="amount"]/text()').get()
        if mrp:
            mrp = mrp.strip()
        else:
            print("MRP not found")

        product_price = response.xpath('//div[@class="new-price"]/span[@class="amount" and @id="pdp-product-price" and @data-testid="new-price"]/text()').get()
        if product_price:
            product_price = product_price.strip()
        else:
            print("Product price not found")

        key_features = response.xpath('//div[@class="cp-keyfeature pd-eligibility-wrap"]/ul/li/text()').extract()

        product_details = {
            'product_title': product_title,
            'overview_text': overview_text,
            'mrp': mrp,
            'product_price': product_price,
            'key_features': key_features,
            'specifications': specifications
        }

        safe_filename = ''.join(e for e in product_title if e.isalnum() or e.isspace()).replace(' ', '_')
        filename = f"{safe_filename}.json"

        save_json_file(filename, json.dumps(product_details))

        time.sleep(1)

    def closed(self, reason):
        self.driver.quit()
