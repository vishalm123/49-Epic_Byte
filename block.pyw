import time
import datetime as dt

end_time = dt.datetime(2022,10,8)

site_block = ["www.aaa.com"]

host_path = "C:/Windows/System32/drivers/etc/hosts"

rd = "127.0.0.1"

while True:
    if dt.datetime.now()<end_time:
        with open(host_path,"r+") as host_file:
            content = host_file.read()
            for website in site_block:
                if website not in content:
                    host_file.write("\n"+rd+"	"+website)
    else:
        with open (host_path,"r+") as host_file:
            content = host_file.readlines()
            host_file.seek(0)
            for lines in content:
                if not any(website in lines for website in site_block):
                    host_file.write(lines)
        host_file.truncate()
    time.sleep(5)