from pathlib import Path
import scrapy
import json
import time
import os 

PROJECT_BASE_LOCATION = '/home/ubuntu/playground/acmandi/data_loader/'

def save_json_file(filename, json_data):
    file_path = f"{PROJECT_BASE_LOCATION}products/{filename}"
    with open(file_path, "w") as outfile:
        outfile.write(json_data)

def get_product_urls():
    links_path = f"{PROJECT_BASE_LOCATION}links/"
    file_names = os.listdir(links_path)
    product_url_list = []
    for filename in file_names:
        file_name=f"{links_path}{filename}"
        file_obj = open(file_name)
        product_urls = json.load(file_obj)
        product_url_list.extend(product_urls)
        file_obj.close()
    return product_url_list


class ProductDetailsSpider(scrapy.Spider):
    name = "product_details"

    def start_requests(self):
        urls = get_product_urls()
        counter = 0
        for url in urls:
            counter+=1
            yield scrapy.Request(url=url, callback=self.parse)
            print(counter)
            if counter>5:
                break

    def parse(self, response):
        # Extract the div element with id "overview_inner_container"
        overview_div = response.xpath('//div[@id="overview_inner_container"]')

        # Get the text content of all the paragraphs (p) within the div
        paragraphs = overview_div.xpath('.//p//text()').extract()

        # Join the paragraphs to form the complete text with new lines
        overview_text = "\n".join(paragraphs).strip()

        print(overview_text)

        specification_keys=response.xpath('//ul[@class="cp-specification-spec-info"]/li[@class="cp-specification-spec-title"]/h4')
        specification_values=response.xpath('//ul[@class="cp-specification-spec-info"]/li[@class="cp-specification-spec-details"]')
        specification_list_length = len(specification_keys)
        specifications = []
        for index in range(specification_list_length):
            # print(index)
            specifications.append({'specification_key':''.join(specification_keys[index].xpath('.//text()').extract()).strip(),
                                   'specification_value':''.join(specification_values[index].xpath('.//text()').extract()).strip()})
        
        product_title = ''.join(response.xpath('//h1[@class="pd-title pd-title-normal"]/text()').extract()).strip()

        # print(product_title)

        product_price = response.xpath('//div[@class="new-price"]/span[@class="amount"]/text()').get()

        # print(product_price)

        mrp = response.xpath('//span[@class="old-price"]/span[@class="amount"]/text()').get()

        # print(mrp)

        key_features = response.xpath('//div[@class="cp-keyfeature pd-eligibility-wrap"]/ul/li/text()').extract()

        # print(key_features)

        product_details= {'product_tile':product_title,'overview_text':overview_text,'mrp':mrp,'product_price':product_price,
                          'key_features':key_features,'specifications':specifications}
        
        #TODO: slash handler in filename/model
        print("product_title")
        print(product_title)

        filename = f"{product_title.split(',')[-1][:-1]}.json"

        save_json_file(filename, json.dumps(product_details))

        time.sleep(1)
        
