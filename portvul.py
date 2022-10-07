import socket
import subprocess
import re

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
x = s.getsockname()[0]
s.close()
subprocess.run(f"nmap --script nmap-vulners/,vulscan/ --script-args vulscandb=scipvuldb.csv -sV {x} -p{port} -oN output1.txt")
with open("output1.txt", "r") as file:
    k = file.read()