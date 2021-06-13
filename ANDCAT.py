# ANDCAT NETWORK DEVICE DATA INSERT SCRIPT
import urllib3
import napalm
import MySQLdb
from netmiko import ConnectHandler
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

def andcat():
    try:
        print('-' * 30)
        print("Connecting to ANDCAT database to access devices table...")

        mydb = MySQLdb.connect(
        host="127.0.0.1",
        user="root",
        passwd="",
        db="andcat")

        mycursor = mydb.cursor()

        tables = ["arp_table", "mac_address_table", "facts", "get_config", "lldp_neighbors", "vlans",
                  "is_alive", "show_interface_status"]
        print("Truncating tables to insert new data...")
        for i in tables:
            truncate = "TRUNCATE TABLE `" + i + "`;"
            print("Truncating " + i + "...")
            mycursor.execute(truncate)
        print('-' * 30)
        mycursor.execute("SELECT * FROM devices;")
        for deviceid, devicename, deviceip in mycursor.fetchall():
            for x in str(deviceid):
                switch_ip = deviceip
                switch_name = devicename
                driver_nxos = napalm.get_network_driver("nxos")
                nxos_switch = driver_nxos(
                    hostname=switch_ip,
                    username="admin",
                    password="x"
                    )
                my_device = {
                    "device_type": "cisco_nxos",
                    "host": switch_ip,
                    "username": "admin",
                    "password": 'x',}
                net_connect = ConnectHandler(**my_device)

                try:
                    print("Connecting to",switch_name,"with IP address -->",switch_ip)
                    command1 = 'show interface status'
                    command2 = 'show vlan'
                    command3 = 'show lldp neighbors'

                    nxos_switch.open()
                    arp_table = nxos_switch.get_arp_table()
                    mac_address_table = nxos_switch.get_mac_address_table()
                    pull_facts = nxos_switch.get_facts()
                    pull_get_config = nxos_switch.get_config()
                    lldp_neighbors = net_connect.send_command(command3, use_textfsm=True)
                    vlans = net_connect.send_command(command2, use_textfsm=True)
                    pull_is_alive = nxos_switch.is_alive()
                    show_interface_status = net_connect.send_command(command1, use_textfsm=True)
                    nxos_switch.close()

                    # Certain calls need to be turned into a list
                    facts = [pull_facts]
                    get_config = [pull_get_config]
                    is_alive = [pull_is_alive]

                    # For the for loop to iterate through this list of variables
                    getters = [arp_table,mac_address_table,facts,get_config,lldp_neighbors,vlans,is_alive,show_interface_status]

                    # REMEMBER TO CHANGE THE POSITIONS IF ADDING OR REMOVING TABLES FROM GETTERS
                    for i in getters:
                        if i == getters[0]:
                            z = print("Inserting into arp_table...")
                            w = "arp_table"
                        elif i == getters[1]:
                            print("Done!")
                            w = "mac_address_table"
                            z = print("Inserting into mac_address_table...")
                        elif i == getters[2]:
                            print("Done!")
                            w = "facts"
                            z = print("Inserting into facts table...")
                        elif i == getters[3]:
                            print("Done!")
                            w = "get_config"
                            z = print("Inserting into get_config table...")
                        elif i == getters[4]:
                            print("Done!")
                            w = "lldp_neighbors"
                            z = print("Inserting into lldp_neighbors table...")
                        elif i == getters[5]:
                            print("Done!")
                            w = "vlans"
                            z = print("Inserting into vlans table...")
                        elif i == getters[6]:
                            print("Done!")
                            w = "is_alive"
                            z = print("Inserting into is_alive table...")
                        elif i == getters[7]:
                            print("Done!")
                            w = "show_interface_status"
                            z = print("Inserting into show_interface_status table...")
                        # ADD more elif statements if adding more tables to getters
                        else:
                            print("ERROR: getters list not defined. Trying to continue...")
                            pass
                        try:
                            for mydict in i:
                                columns = ', '.join("`" + str(x) + "`" for x in mydict.keys())
                                values = ', '.join("'" + str(x).replace("[", '').replace("]", '').replace("'", '') + "'" for x in mydict.values())

                                # ADD more elif statements if adding more tables to getters
                                sqlquery = "INSERT INTO %s (`deviceid`, %s ) VALUES ('" + str(deviceid) + "', %s);"
                                sql = (sqlquery) % (w, columns, values)
                                mycursor.execute(sql)
                                mydb.commit()
                        except Exception as e3:
                                print('Error inserting into table -->',w,'ERROR ===> ', e3),print('Trying to continue....'),
                                pass
                except Exception as e2:
                    print("Error connecting to -->",switch_ip,"with ERROR ===>",e2),print("Trying to connect to other devices in device table..... "),
                    pass
                # After successful insertion of data
                print("Done!")
                print("Successfully connected to",switch_name, "and inserted data into ANDCAT Database!")
                print('-'*30)
    except Exception as e1:
        print('Error connecting to device table, Exiting with ERROR ===> ', e1), exit()
andcat()
