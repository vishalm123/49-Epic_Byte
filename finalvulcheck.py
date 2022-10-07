import socket
import subprocess
import re

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
x = s.getsockname()[0]
s.close()
subprocess.run(f"nmap {x} -oN output.txt")
with open("output.txt", "r") as file:
    k = file.readlines()
for i in k.copy():
    if "unknown" in i:
        k.remove(i)
k = [re.split(r'\s{2,}',i.strip()) for i in k[5:-2]]
open_ports = []
for i in range(len(k)):
    temp = k[i]
    open_ports.append({"port":temp[0],"state":temp[1],"service":temp[2]})
