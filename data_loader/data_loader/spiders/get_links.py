from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import scrapy

class CromaSpider(scrapy.Spider):
    name = 'get_links'
    start_urls = ['https://www.croma.com/home-appliances/air-conditioners/split-acs/c/393']

    def __init__(self):
        chrome_options = Options()
        chrome_options.add_argument('--headless')
        chrome_options.add_argument('--no-sandbox')
        chrome_options.add_argument('--disable-dev-shm-usage')
        self.driver = webdriver.Chrome(ChromeDriverManager().install(), options=chrome_options)
        super().__init__()

    def parse(self, response):
        # Load the initial page
        self.driver.get(response.url)

        # Simulate clicking on the "View More" button
        self.click_view_more()

        # Create a Scrapy HtmlResponse from the current Selenium page
        body = self.driver.page_source
        response = scrapy.Selector(text=body)

        # Extract links from the loaded page
        yield from self.parse_links(response)

    def parse_links(self, response):
        # Extract links from the loaded page
        base_url = 'https://www.croma.com'
        for product in response.css('li.product-item'):
            link = product.css('div.cp-product[data-testid="product-id"] a::attr(href)').get()
            if link:
                yield {
                    'link': base_url + link
                }

    def click_view_more(self):
        # Wait for the view-more-div element to be present using XPath
        view_more_div = WebDriverWait(self.driver, 10).until(
            EC.presence_of_element_located((By.XPATH, '//div[@class="view-more-div"]'))
        )

        # Once the view-more-div is present, find the button inside it using XPath
        view_more_button = view_more_div.find_element(By.XPATH, './/button[@class="btn btn-secondary btn-viewmore"]')
        self.driver.execute_script("arguments[0].click();", view_more_button)

        # Click the button
        # view_more_button.click()
        # self.driver.execute_script("arguments[0].querySelector('button.btn.btn-secondary.btn-viewmore').click();", view_more_div)

    def closed(self, reason):
        # Close the Selenium WebDriver when the spider is closed
        self.driver.quit()
