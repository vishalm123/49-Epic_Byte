import socket
import subprocess
import os
port = 5432
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
x = s.getsockname()[0]
s.close()
subprocess.run(f"nmap --script nmap-vulners/,vulscan/ --script-args vulscandb=scipvuldb.csv -sV {x} -p{port} -oN output1.txt")
os.system("output1.txt")