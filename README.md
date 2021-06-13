# ANDCaT
Automated Network Device Configuration and Telemetry | Version 1
Hey guys, this project was made to help network engineers gather data from network devices and insert the data dynamically into a database. The script converts lists of dictionaries pulled from the network devices into SQL insert statements. There is a SQL schema included, along with the ANDCaT.py script. The ANDCaT script iterates through a "devices" table(which needs to be populated ahead of time), pulls the IP and device name, connects to each device, then pulls the data and inserts into a specified database. 
