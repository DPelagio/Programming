from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import datetime

username = "watir_example@example.com"
password = "password"

driver = webdriver.Firefox(executable_path=r'./geckodriver')
driver.get("https://a.testaddressbook.com")

login = driver.find_element_by_id("sign-in").click()
email = driver.find_element_by_id("session_email").send_keys(username)
pswd = driver.find_element_by_id("session_password").send_keys(password)
submit = driver.find_element_by_name("commit").click()

addresses = driver.find_element_by_link_text("Addresses").click()
driver.get("https://a.testaddressbook.com/addresses/new")

driver.find_element_by_id("address_first_name").send_keys("Daniel")
driver.find_element_by_id("address_last_name").send_keys("PP")
driver.find_element_by_id("address_street_address").send_keys("Carlos Lazo")
driver.find_element_by_id("address_secondary_address").send_keys("Av de los Poetas")
driver.find_element_by_id("address_city").send_keys("Mexico City")
driver.find_element_by_id("address_state").send_keys("California")
driver.find_element_by_id("address_zip_code").send_keys("01800")
driver.find_element_by_id("address_country_canada").click()

start_date = driver.find_element_by_id('address_birthday')
type1 = 'string'
date2 = '10/10/1999'
driver.execute_script('arguments[0].setAttribute("type", "%s")' % type1, start_date)
driver.execute_script('arguments[0].setAttribute("value", "%s")' % date2, start_date)
driver.find_element_by_id("address_age").send_keys("30")
driver.find_element_by_id("address_website").send_keys("https://a.testaddressbook.com")
driver.find_element_by_id("address_picture").send_keys("/Users/pelagio/Documents/GitHub/Programming/Sem7/pruebas/text.txt")
driver.find_element_by_id("address_phone").send_keys("01800 1234 5678")
driver.find_element_by_id("address_interest_climb").click()
driver.find_element_by_id("address_note").send_keys("See, filling out a form with Selenium is easy!")
driver.find_element_by_name("commit").click()

driver.close()