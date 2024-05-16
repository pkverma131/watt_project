from pathlib import Path
import scrapy
import json
import time

PROJECT_BASE_LOCATION = '/home/ubuntu/devwork/digital-properties/acmandi/data_loader/'

def save_json_file(filename, json_data):
    file_path = f"{PROJECT_BASE_LOCATION}/links/{filename}"
    with open(file_path, "w") as outfile:
        outfile.write(json_data)


class ProductDetailsSpider(scrapy.Spider):
    name = "category_listing_link"

    def start_requests(self):
        urls = ['https://www.croma.com/home-appliances/air-conditioners/c/46']
        counter = 0
        for url in urls:
            counter+=1
            yield scrapy.Request(url=url, callback=self.parse)
            print(counter)

    def parse(self, response):
        
        category_listing_links = response.xpath('//div[@class="cp-section-home banner-spacing"]/div[@class="sec-cont"]/div/div/div/div/div/a/@href').extract()

        filename = f"category_listing_links.json"

        save_json_file(filename, json.dumps(category_listing_links))

        time.sleep(1)
        

        
