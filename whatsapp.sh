#!/usr/bin/env python3


from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service

path = "/usr/bin/chromedriver"
options = Options()
options.debugger_address = "127.0.0.1:9222"
service = Service(executable_path=path)
driver = webdriver.Chrome(service=service, options=options)


def grab_latest_link():
    try:
        links = driver.find_elements(By.XPATH, "//div[@role='row']//a")

        if links:
            latest_link = links[-1].get_attribute("href")
            # print(f"Latest link found: {latest_link}")
            return latest_link
        else:
            print("No links found in the current chat.")
    except Exception as e:
        print(f"An error occurred: {e}")


print(grab_latest_link())
# grab_latest_link()
