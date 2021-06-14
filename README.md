# ANDCaT

Overview

Setup

First, clone this repo to your local system. After you clone the repo, make sure to run the setup.py file, so you can install any dependencies you may need. To run the setup.py file, run the following command in your terminal.

Enter a virtual environment and type - 

pip install -r requirements.txt

This will install all the dependencies listed in the setup.py file. Once done you can use the library wherever you want.Automated Network Device Configuration and Telemetry | Version 1

Hey guys, this project was made to help network engineers gather data from network devices and insert the data dynamically into a database. The script converts lists of dictionaries pulled from the network devices into SQL insert statements. There is a SQL schema included, along with the ANDCaT.py script. The ANDCaT script iterates through a "devices" table(which needs to be populated ahead of time), pulls the IP and device name from the "devices" table, connects to each device, then pulls the data with Napalm/Netmiko and inserts into a specified database. 
