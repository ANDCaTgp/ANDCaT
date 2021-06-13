import MySQLdb
def truncate():
    mydb = MySQLdb.connect(
        host="127.0.0.1",
        user="root",
        passwd="",
        db="andcat")

    mycursor = mydb.cursor()


    tables = ["arp_table", "mac_address_table", "facts", "get_config", "lldp_neighbors", "vlans","is_alive", "show_interface_status"]
    for i in tables:
        truncate = "TRUNCATE TABLE `" + i + "`;"
        print("Truncating " + i + "...")
        mycursor.execute(truncate)
truncate()
