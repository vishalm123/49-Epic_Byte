import os
import time
import schedule

def flush():
    os.system("ipconfig /flushdns")

def schedule_specified(time):
    schedule.every().day.at(time or "0:0").do(flush)
    while True:
        schedule.run_pending()
        time.sleep(1)


def not_specified():
    flush()

