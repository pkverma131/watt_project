from pathlib import Path

import scrapy

#https://api.croma.com/searchservices/v1/category/393?currentPage=0&query=:relevance&fields=FULL&channel=WEB&channelCode=400049

def write_list_to_file(filename, list1):
    with open(filename, 'w+') as f:
        for item in list1:
            f.write('%s\n' %item)
    f.close()


class QuotesSpider(scrapy.Spider):
    name = "get_products"

    def start_requests(self):
        urls = [
            'https://www.croma.com/home-appliances/air-conditioners/split-acs/c/393'
            ]
        for url in urls:
            yield scrapy.Request(url=url, callback=self.parse)

    def parse(self, response):
        base_url = 'https://www.croma.com'
        filename = 'product_links.json'
        product_links = []
        results = response.xpath('//div[@class = "product-img plp-card-thumbnail"]//a')
        for result in results:
            product_links.append(base_url+result.xpath('@href').extract()[0])
        print(product_links)
        write_list_to_file(filename, product_links)
        
