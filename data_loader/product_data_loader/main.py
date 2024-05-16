from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

# import PROJECT_BASE_LOCATION

link_file_path = 'specfications.hmtl'

if __name__=='__main__':
    options = Options()
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=options)
    driver.get("https://www.croma.com/voltas-vectra-4-in-1-convertible-1-3-ton-3-star-inverter-split-ac-with-anti-dust-filter-2023-model-copper-condenser-163v-vectra-pearl-/p/270260")
    print(driver.find_element("xpath", "//*div[@class='cp-specification']"))

    driver.close()