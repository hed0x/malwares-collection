import os
import requests
import discord
import re
class NitroSniper():
	def __init__(self):
		self.logo = """\u001b[95;1m
\t╔╗╔┌─┐┌─┐┬─┐┌─┐┌─┐┌─┐┬─┐
\t║║║└─┐│  ├┬┘├─┤├─┘├┤ ├┬┘
\t╝╚╝└─┘└─┘┴└─┴ ┴┴  └─┘┴└─\033[00m
\t	- By: Variez\n
		"""
		self.banner()

	def banner(self):
		os.system("cls")
		print(self.logo)
		token = input("[\u001b[96;1m$\033[00m] - Please Enter your Discord Token: ")
		print("[\u001b[96;1m$\033[00m] - Attempting to login... ")
		try:
			Client().run(token, bot=False)
		except Exception as e:
			print(f"[\u001b[91;1mx\033[00m] - Error while logging in: {e} ")
			input("\n")



class Client(discord.Client):
	async def on_connect(self):
		print(f"[\u001b[92;1m+\033[00m] - Logged In as {self.user}")

	async def on_message(self, message):
		try:
			if 'discord.gift' in message.content:
				code = message.content.split("gift/")[1]
				if len(code) in range(10,30):
					result = requests.post('https://discordapp.com/api/v6/entitlements/gift-codes/'+code+'/redeem', json={"channel_id":str(message.channel.id)}, headers={'authorization':token}).text
					if 'This gift has been redeemed already.' in result:
						print("[\u001b[93;1mx\033[00m] - Nitro has already been redeemed")
					elif 'Unknown Gift Code' in result:
						print("[\u001b[91;1mx\033[00m] - Invalid Nitro Code")
					elif 'nitro' in result:
						print("[\u001b[92;1mx\033[00m] - Nitro Code Claimed")
				else:          
					print("[\u001b[91;1mx\033[00m] - Invalid Nitro Code")
		except Exception as e:
			print(f"[\u001b[93;1mx\033[00m] - An Error has occured: {e}")
			pass
