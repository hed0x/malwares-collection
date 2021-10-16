import random
import string
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad

class Locker():
    """
    File Encryption
    """
    def __init__(self):
        self.key = self.generate_key(32)
        self.crypto = AES.new(self.key.encode(), AES.MODE_ECB)

    def generate_key(self, klen):
        return ''.join(random.choice(string.ascii_letters + string.digits) for i in range(klen))

    def encrypt_content(self, content):
        encrypted_text = self.crypto.encrypt(pad(content,32))
        return encrypted_text