# import socket
# import subprocess
# import re

# s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
# s.connect(("8.8.8.8", 80))
# x = s.getsockname()[0]
# s.close()
# subprocess.run(f"nmap --script nmap-vulners/,vulscan/ --script-args vulscandb=scipvuldb.csv -sV {x} -p{port}")
# with open("output.txt", "r") as file:
#     k = file.read()
# from pysafebrowsing import SafeBrowsing
# website = 'http://malware.testing.google.test/testing/malware/'
# s = SafeBrowsing('AIzaSyBe4zQB__xvjNedIG3xdbPbG34Pprojjg0')
# r = s.lookup_urls([website])
# k = ""
# if (r[website]['malicious']):
#    k+="malicious\n"
#    k+=f"threats:{','.join(r[website]['threats'])}"
# print(k)
# import time
# import datetime as dt

# end_time = dt.datetime(2022,10,9)

# site_block = [str(input("Enter website link "))]

# host_path = "C:/Windows/System32/drivers/etc/hosts"

# rd = "127.0.0.1"

# while True:
#     if dt.datetime.now()<end_time:
#         with open(host_path,"r+") as host_file:
#             content = host_file.read()
#             for website in site_block:
#                 if website not in content:
#                     host_file.write("\n"+rd+"	"+website)
#     else:
#         with open (host_path,"r+") as host_file:
#             content = host_file.readlines()
#             host_file.seek(0)
#             for lines in content:
#                 if not any(website in lines for website in site_block):
#                     host_file.write(lines)
#         host_file.truncate()
#     time.sleep(5)

import os
import time
import schedule

def flush():
    os.system("ipconfig /flushdns")

def schedule_specified(time):
    time = input("Enter time") #make this input according to datetime input
    schedule.every().day.at(time or "0:0").do(flush)
    while True:
        schedule.run_pending()
        time.sleep(1)


