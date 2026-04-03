# Automated Google Form Filler (Selenium)

## Overview
A browser automation tool built using Selenium to handle time-sensitive Google Form submissions.

## Features
- Automatically detects and fills form fields
- Optimized for fast execution to minimize submission latency
- Handles dynamic elements and page load delays
- Includes basic failure handling and retries

## Tech Stack
- Python
- Selenium WebDriver

## Use Case
Designed for scenarios where form submission speed is critical (e.g., limited-slot registrations).

## How to Run
1. Follow selenium website for setting up selenium for python..

3. Run script:
   run the scripts as per requirement.

## Notes
You can run all 3 scripts at once. Use the whatsapp.sh to get data from a already logged in whatsapp web page in a new terminal. Thus chrome must be opened by default with a command like google-chrome-stable --user-data-dir=~/.config/google-chrome/my-profile --remote-debugging-port=9222. 

Replace paths as per your situation, you can also add or remove time.sleep() for increasing or decreasing the time of sleep

This project works fine on an arch linux setup, to run on other systems you may need to tweak things.

All this code can be optimised further , i know i have mad mistakes in many places and it could be improved further. But this worked for my usecase , hence if someone is interested he can use this code .

There some issue with the large_answer_filler.sh , it fails in somecases which i have to work on . But the other two file works fine . 

Also make sure the google autofill is turned off in chrome. 
