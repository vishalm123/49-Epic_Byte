import time
import datetime as dt

j=0
rem = []
site_unblock = [str(input("Enter website link "))]
sl = len(site_unblock)
host_path = "H:/Hackathon/hosts.txt"
with open(host_path,"r+") as file:
    text = file.readlines()
    # Delete
    for i in text:
        print(i)
        if site_unblock in i:
            rem.append(j)
        j+=1
    # new_text = text.replacelin(site_unblock[0], '')
    # # Write
    # file.write(new_text)
    # file.truncate()
    for k in rem:
        text[k] = " "
    file.writelines(text)