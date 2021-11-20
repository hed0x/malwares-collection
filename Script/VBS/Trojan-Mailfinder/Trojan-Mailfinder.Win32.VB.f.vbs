Dim SpamMsgs(8)
Dim sc
' Sent packet event
Function PacketSend(myPacket)
	Select Case True
		Case mid(mypacket,1,2)=chra("FF 0C")
			module.setcallbackstate "spam",True
		Case mid(mypacket,1,2)=chra("FF 40")
			module.setcallbackstate "spam",False
	End Select
	
	PacketSend=myPacket
End Function

' Recieved packet event
Function PacketRecv(myPacket)
	
	Select Case True
		Case mid(mypacket,1,2)=chra("FF 3A")
			script.myOwner.myOwner.SendInfo
		Case mid(mypacket,1,2)=chra("FF 5A")
			myPacket=""
		Case mid(mypacket,1,2)=chra("FF 5B")
			myPacket=""
	End Select
	
	PacketRecv=myPacket
End Function

' Command event
Sub UserCommand(sCmd)


End Sub

' Load event
Sub ModuleLoad()
	spammsgs(0)="OMG CHECK OUT www.gamehacks.be THEY GOT SOME AWSOME D2 HACKS!!"
	spammsgs(1)="Hey, did you hear that www.gamehacks.be has some really cool 1.10 d2 hacks?!"
	spammsgs(2)="If your looking for hacks look no further, gamehacks.be is your #1 D2 Hack supplier!"
	spammsgs(3)=".f m check out gamehacks.be, I found the dupe there."
	
	sc=0

	module.createcallback "Spambot","spam",8000

End Sub

Sub Spambot()
	If sc>ubound(spammsgs) Then sc=0
	sendchan spammsgs(sc)
	script.output "Spamming: " & spammsgs(sc),0
	sc=sc+1	
End Sub

Sub sendchan(s)
	script.SendToServer chra("FF 0E") & chr(len(s)+5) & chr(0) & s & chr(0)
End Sub

function chra(s)
	dim arr,c
	arr=split(s," ")
	for c=0 to ubound(arr)
		chra=chra & chr(clng("&H" & arr(c)))
	next
end function