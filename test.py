# import subprocess
# import re


# x = list(subprocess.Popen(["tasklist"],stdout=subprocess.PIPE).communicate())[0].splitlines()[3:]
# x = [re.split(r'\s{2,}',i.decode("utf-8")) for i in x]
# for i in range(len(x)):
#     x[i][1] = x[i][1].split()
# nx = []
# for i in x:
#     nx.append([i[0],i[1][0]])

# y = list(subprocess.Popen('netstat -aon',shell = True,stdout=subprocess.PIPE).communicate())[0].splitlines()[4:]
# y = [re.split(r'\s{2,}',i.decode("utf-8")) for i in y]
# for i in range(len(y)):
#     for j in range(len(nx)):
#         if nx[j][-1] == y[i][-1]:
#             nx[j].append(y[i][2])
#             nx[j].append(y[i][3])
#             nx[j].append(y[i][4])
# for i in nx.copy():
#     if(len(i)<3):
#         nx.remove(i)
# for i in range(len(nx)):
#     temp = nx[i]
#     nx[i] = {"name":temp[0],"pid":temp[1],"local address":temp[2],"foreign address":temp[3],"STATE":temp[4]}
# open_ports = [i for i in nx if i["STATE"]=="LISTENING" or i["STATE"]=="ESTABLISHED"]
# for i in open_ports.copy():
#     if re.match('0.0.0.0',i["local address"]) or re.match('127.0.0.1',i["local address"]):
#         open_ports.remove(i)
# # save this as app.py

# # app = Flask(__name__)

# # @app.route("/")
# # def index():
# #     return render_template("Proj.html")


# # @app.route("/api",methods=['GET'])
# # def hello():
# #     print(len(open_ports))
# #     state = []
# #     foreign_address =[]
# #     local_address = []
# #     name =[]
# #     pid =[]
# #     for i in open_ports:
# #         state.append(i["STATE"])
# #         foreign_address.append(i["foreign address"])
# #         local_address.append(i["local address"])
# #         name.append(i["name"])
# #         pid.append(i["pid"])
# #     # return render_template("table.html",state=state,foreign_address=foreign_address,local_address=local_address,name=name,pid=pid,open_ports=open_ports)
# #     return x


# app.run(debug=True)

# app = Flask(__name__)
# @app.route("/api",methods=['GET'])
# def hello():
#     return nx
# if __name__ == "__main__":
#     app.run()
from flask import *

import socket
import os
import subprocess
import re
from pysafebrowsing import SafeBrowsing

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))
x = s.getsockname()[0]
s.close()
os.system(f"nmap {x} -oN output.txt")
with open("output.txt", "r") as file:
    k = file.readlines()
for i in k.copy():
    if "unknown" in i:
        k.remove(i)
k = [re.split(r'\s{1,}',i.strip()) for i in k[5:-2]]
open_ports = []
for i in range(len(k)):
    
    temp = k[i]
    open_ports.append({"port":temp[0],"state":temp[1],"service":temp[2]})
app = Flask(__name__)
@app.route("/api",methods=['GET'])
def hello():
    return open_ports
@app.route("/test",methods=['POST'])
def test():
    port = request.form.get('port')
    subprocess.run(f"nmap --script nmap-vulners/,vulscan/ --script-args vulscandb=scipvuldb.csv -sV {x} -p{port} -oN output1.txt")
    os.system("output1.txt")

@app.route("/mal",methods=['POST'])
def malicious():
    website = request.form.get('website')
    s = SafeBrowsing('AIzaSyBe4zQB__xvjNedIG3xdbPbG34Pprojjg0')
    r = s.lookup_urls([website])
    k = ""
    if (r[website]['malicious']):
     k+="malicious\n"
     k+=f"threats:{','.join(r[website]['threats'])}"
     
     print(website)
     return k
if __name__ == "__main__":
    app.run()