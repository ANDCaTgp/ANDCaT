ANDCaT
======

OVERVIEW
--------
Automated Network Device Configuration and Telemetry | Version 1

Hey guys, this project was made to help network engineers gather data from network devices and insert the data dynamically into a database. The script converts lists of dictionaries pulled from the network devices into SQL insert statements. There is a SQL schema included, along with the ANDCaT.py script. The ANDCaT script iterates through a "devices" table(which needs to be populated ahead of time), pulls the IP and device name from the "devices" table, connects to each device, then pulls the data with Napalm/Netmiko and inserts into a specified database.

SETUP
-----

This project can be tested in a virtual enviroment after installing all the requirements listed in "requirements.txt". Use "pip install -r requirements.txt" to install all requirements recursively from the list in your venv. This project was setup along with a SQL server, however the ANDCaT group is working on making this project more integrated by using SQLite3 as the database so everything can be run easily on one system.
