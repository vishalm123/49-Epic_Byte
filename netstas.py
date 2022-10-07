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
for i in nx.copy():
    if(len(i)<3):
        nx.remove(i)