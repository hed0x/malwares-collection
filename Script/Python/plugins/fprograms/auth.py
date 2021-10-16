import PyQt5.QtWidgets
import sys

'''
#D2E2E9
#4C6C6F
#CBCAB7
#3D4641
#5A5C51
'''

class LoginPanel(PyQt5.QtWidgets.QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setFixedSize(600, 400)

        self.container = PyQt5.QtWidgets.QWidget(self)
        self.container.setStyleSheet(
            """
            background-color: #4C6C6F;
            border-radius: 15px;
            color: #3D4641;
            border: 2px solid #D2E2E9;
        """
        )

        self.container.setGeometry(
            self.rect().adjusted(80, 80, -80, -80)
        )
        effect = PyQt5.QtWidgets.QGraphicsDropShadowEffect(
            blurRadius=20, offset=PyQt5.QtCore.QPointF(0, 0)
        )
        self.container.setGraphicsEffect(effect)

        self.passfield = PyQt5.QtWidgets.QLineEdit(self)
        self.userfield = PyQt5.QtWidgets.QLineEdit(self)

        self.username_field()
        self.password_field()
        self.login = PyQt5.QtWidgets.QPushButton('Login', self)
        self.login_button()

        lay = PyQt5.QtWidgets.QFormLayout(self)

        lay.setContentsMargins(160, 160, 160, 160)
        lay.addRow("Username:", self.userfield)
        lay.addRow("Password:", self.passfield)
        #lay.addRow(self.login)


    def login_button(self):
        self.login.setStyleSheet("""
                        QPushButton {
                            background-color: #3D4641;
                            border-radius: 9.5px;
                            color: #CBCAB7;
                            font-size: 20px;
                            border-color: #D2E2E9;
                        }
                        QPushButton:hover {
                            background-color: #5A5C51;
                            color: #CBCAB7;
                            font-size: 20px;
                            border-radius: 9.5px;
                            border-color: #D2E2E9;
                        }
        """)
        self.login.resize(280,30)
        self.login.move(160,250)
        self.login.clicked.connect(self.user_login)

    def username_field(self):
        """
        """
        self.userfield.setStyleSheet("""
                            QLineEdit {
                                background-color: #CBCAB7;
                                color: #3D4641;
                                border-radius: 9.5px;
                                border-color: #D2E2E9;
                            }
        """)


    def password_field(self):
        """
        """
        self.passfield.setEchoMode(PyQt5.QtWidgets.QLineEdit.Password)
        self.passfield.setStyleSheet("""
                            QLineEdit {
                                background-color: #CBCAB7;
                                color: #3D4641;
                                border-radius: 9.5px;
                                border-color: #D2E2E9;
                            }
        """)

    @PyQt5.QtCore.pyqtSlot()
    def user_login(self):
        if self.userfield.text() != "admin" or self.passfield.text() != "admin": PyQt5.QtWidgets.QMessageBox.critical(self, "Incorrect Credentials", "You have entered invalid credentials, please try again.")
        else: self.hide()


class Auth(PyQt5.QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Login")

        self.setFixedSize(1200,800)
        self.setWindowFlags(PyQt5.QtCore.Qt.WindowCloseButtonHint | PyQt5.QtCore.Qt.WindowMinimizeButtonHint)
        self.setWindowIcon(PyQt5.QtGui.QIcon("assets\\login.ico"))
        self.background = PyQt5.QtWidgets.QLabel("", self) 

        #self.layout = PyQt5.QtWidgets.QGridLayout()
        #self.layout.addWidget(LoginPanel(), 0, 1)
        self.set_background()
        self.panel = LoginPanel(self)
        self.center_panel()
        self.show()
        #self.layout.setAlignment(PyQt5.QtCore.Qt.AlignCenter)




    def center_panel(self):
        g = self.panel.geometry()
        g.moveCenter(self.rect().center())
        self.panel.setGeometry(g)
        self.panel.raise_()

    def set_background(self):
        img = PyQt5.QtGui.QPixmap("assets\\background.png")
        pixmap = img.scaled(self.width(), self.height())
        self.background.setPixmap(img)
        self.background.resize(self.width(), self.height())


