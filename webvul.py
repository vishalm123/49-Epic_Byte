import socket
import subprocess
import os

subprocess.run(f"nmap --script nmap-vulners/,vulscan/ --script-args vulscandb=cve.csv -sV {website} -oN output1.txt")
os.system("web_vul.txt")