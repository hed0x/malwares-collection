# coding:utf-8
import os
import time
import threading
import subprocess
import traceback

daemon_file = os.path.join(os.getenv('public'), 'ServiceHub', 'daemon.txt')


def xlog(title, content):
    with open(os.path.join(os.getenv('public'), 'ServiceHub', 'daemon_log.txt'), "a+") as f:
        f.write("[{}] [{}]\t{}\n".format(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()), title, content))


def mutex():
    daemon_d_file = os.path.join(os.getenv('public'), 'ServiceHub', 'daemon_d.txt')
    try:
        if os.path.exists(daemon_file):
            with open(daemon_file, mode='r') as f:
                try:
                    last_time = f.read()
                    last_time = int(float(last_time))
                except:
                    try:
                        last_time = os.stat(daemon_file).st_mtime
                    except:
                        last_time = time.time()
                if time.time() - last_time >= 10 or os.path.exists(daemon_d_file):
                    try:
                        os.remove(daemon_d_file)
                    except:
                        pass
                    return True
                else:
                    return False
        else:
            return True
    except:
        xlog('mutex', traceback.format_exc())
        return True


def deamon():
    while True:
        try:
            watch_d_file = os.path.join(os.getenv('public'), 'ServiceHub', 'watch_d.txt')
            watch_file = os.path.join(os.getenv('public'), 'ServiceHub', 'watch.txt')
            if os.path.exists(watch_file):
                with open(watch_file, mode='r') as f:
                    try:
                        last_time = f.read()
                        last_time = int(float(last_time))
                    except:
                        try:
                            last_time = os.stat(watch_file).st_mtime
                        except:
                            last_time = time.time()
                    if time.time() - last_time >= 60:
                        with open(watch_file, mode='w') as f:
                            f.write(str(time.time()))
                        with open(watch_d_file, mode='w') as f:
                            f.write(str(time.time()))
                        subprocess.Popen("SCHTASKS /Run /TN SYSTEM_SETTINGS", shell=True)
                        time.sleep(60)
            else:
                with open(watch_d_file, mode='w') as f:
                    f.write(str(time.time()))
                with open(watch_file, mode='w') as f:
                    f.write(str(time.time()))
                subprocess.Popen("SCHTASKS /Run /TN SYSTEM_SETTINGS", shell=True)
            with open(daemon_file, mode='w') as f:
                f.write(str(time.time()))
        except:
            xlog('mutex', traceback.format_exc())
        finally:
            time.sleep(3)


try:
    if (mutex()):
        threading.Thread(target=deamon).start()
except:
    xlog('main', traceback.format_exc())