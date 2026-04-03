#!/usr/bin/env python3

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service

from selenium.common.exceptions import NoSuchElementException, TimeoutException

import time
import signal
import sys

my_data = {
    "name": "Name ",
    "mail": "email@gmail.com ",
    "ph": "0123456789 ",
    "mobile": "0123456789 ",
    "question": " answer ",
}


def stop(signum, frame):
    raise Exception


signal.signal(signal.SIGALRM, stop)


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

# time.sleep(0.5)
driver.implicitly_wait(60)
# wait = WebDriverWait(driver, 30)



box_list = driver.find_elements(
    by="xpath", value='//div[@role="list"]/div[@role="listitem"]'
)



# This tells Selenium: "Don't wait more than 2 seconds to find ANY element"
driver.implicitly_wait(0.2)

for box in box_list:
    try:
        # If the element isn't found in 2 seconds, this will now skip immediately
        question = box.find_element(
            by="xpath", value=".//div[@role='heading']//span[1]"
        ).text
        print(f"Processing: {question}")

        answer_element = box.find_element(by="xpath", value='.//input[@type!="hidden"]')

        # Perform the logic
        for key in my_data:
            if key in question.lower():
                answer_element.send_keys(f"{my_data[key]}")

        print("Task finished for this box")

    except (NoSuchElementException, TimeoutException):
        print("Skipped iteration: Element not found or timed out")
        continue
    except Exception as e:
        print(f"Skipped iteration due to error: {e}")
        continue

# submit_button = wait.until(
#    EC.element_to_be_clickable((By.XPATH, "//div[@aria-label='Submit']"))
# )
while True:
    time.sleep(0.1)
    submit_button = driver.find_element(by="xpath", value="//div[@aria-label='Submit']")
    # submit_button = driver.find_element(by="xpath", value="//div[([@role='button'])")
    driver.execute_script("arguments[0].click();", submit_button)
    # submit_button.send_keys()
time.sleep(0.2)
driver.quit()
