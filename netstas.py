import subprocess
import re

x = list(subprocess.Popen(["tasklist"],stdout=subprocess.PIPE).communicate())[0].splitlines()[3:]
x = [re.split(r'\s{2,}',i.decode("utf-8")) for i in x]
for i in range(len(x)):
    x[i][1] = x[i][1].split()
nx = []
for i in x:
    nx.append([i[0],i[1][0]])

y = list(subprocess.Popen('netstat -aon',shell = True,stdout=subprocess.PIPE).communicate())[0].splitlines()[4:]
y = [re.split(r'\s{2,}',i.decode("utf-8")) for i in y]
for i in range(len(y)):
    for j in range(len(nx)):
        if nx[j][-1] == y[i][-1]:
            nx[j].append(y[i][2])
            nx[j].append(y[i][3])
            nx[j].append(y[i][4])
for i in nx.copy():
    if(len(i)<3):
        nx.remove(i)
for i in range(len(nx)):
    temp = nx[i]
    nx[i] = {"name":temp[0],"pid":temp[1],"local address":temp[2],"foreign address":temp[3],"STATE":temp[4]}
open_ports = [i for i in nx if i["STATE"]=="LISTENING" or i["STATE"]=="ESTABLISHED"]
for i in open_ports.copy():
    if re.match('0.0.0.0',i["local address"]) or re.match('127.0.0.1',i["local address"]):
        open_ports.remove(i)
