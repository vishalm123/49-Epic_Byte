import socket
import subprocess
import re

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
x = s.getsockname()[0]
s.close()
subprocess.run(f"nmap --script nmap-vulners/,vulscan/ --script-args vulscandb=scipvuldb.csv -sV {x} -p{port}")
with open("output.txt", "r") as file:
    k = file.read()