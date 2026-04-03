#!/usr/bin/env python3

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service


import time
import sys

my_data = {
    "name": "Name ",
    "mail": "email@gmail.com ",
    "ph": "0123456789 ",
    "mobile": "0123456789 ",
    "question": " answer ",
}


if len(sys.argv) > 1:
    website = sys.argv[1]
else:
    website = input("website :")

path = "/usr/bin/chromedriver"

options = Options()
options.debugger_address = "127.0.0.1:9222"
# options.add_argument("--headless")


service = Service(executable_path=path)
driver = webdriver.Chrome(service=service, options=options)
# driver = webdriver.Chrome(service=service)
driver.get(website)

time.sleep(0.5)
driver.implicitly_wait(60)
# wait = WebDriverWait(driver, 30)


radio_list = driver.find_elements(
    by="xpath",
    value='//div[@role="list"]/div[@role="listitem"]//div[@role="radio"]',
)

# driver.execute_script("arguments[0].click();", click_list[1])
for elem in radio_list:
    ques = elem.find_element(by="xpath", value="../..//span").text
    for key, value in my_data.items():
        if value in ques.lower():
            driver.execute_script("arguments[0].click();", elem)

time.sleep(0.1)
check_list = driver.find_elements(
    by="xpath",
    value='//div[@role="list"]/div[@role="listitem"]//div[@role="checkbox"]',
)

for elem in check_list:
    ques = elem.find_element(by="xpath", value="../..//span").text
    for key, value in my_data.items():
        if value in ques.lower():
            driver.execute_script("arguments[0].click();", elem)

time.sleep(0.1)


# submit_button = wait.until(
#    EC.element_to_be_clickable((By.XPATH, "//div[@aria-label='Submit']"))
# )
# finally:
#    time.sleep(0.5)
#    submit_button = driver.find_element(by="xpath", value="//div[@aria-label='Submit']")
## submit_button = driver.find_element(by="xpath", value="//div[([@role='button'])")
# driver.execute_script("arguments[0].click();", submit_button)
# submit_button.send_keys()
time.sleep(0.2)
driver.quit()
