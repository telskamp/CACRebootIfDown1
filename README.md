# CACRebootIfDown1
Powershell script to reboot your cloudatcost server when it is down/unreachable

# usage
1. Download the script
2. Fill in you api key and email adress used to login to https://panel.cloudatcost.com the api key can be generated using the settings button.
3. DO NOT forget to whitelist your PUBLIC ip adress in the api section of the settings panel 
4. Run script
5. Profit
6. Schedule the script using windows task scheduler
Do not run the script more than once every 10 minutes(else you will force slow booting systems into a reboot-loop)

# More info
- Please adhere to the cloudatcost terms and conditions:http://www.cloudatcost.com/terms.php
- more info on the api can be found here: https://panel.cloudatcost.com/api-details.php
