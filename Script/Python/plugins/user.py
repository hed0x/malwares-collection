import os
import requests



class User():
	def __init__(self):
		self.ud = ""
		self.get_ip()
		self.get_username()
		self.get_computername()

	def get_ip(self):
		self.ud += requests.get("https://api.ipify.org?format=json").json()["ip"]

	def get_username(self):
		self.ud += "   " + os.getlogin()

	def get_computername(self):
		self.ud += "   "+ os.getenv('COMPUTERNAME')
